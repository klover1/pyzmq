"""
Simple example of using zmq log handlers
This starts a number of subprocesses with PUBLRHandlers that generate
log messages at a regular interval.  The main process has a SUB socket,
which aggregates and logs all of the messages to the root logger.
"""
from __future__ import print_function

import logging
import os
import random
import sys
import time

import zmq
from zmq.log.handlers import TopicLogger
from zmq.utils.strtypes import bytes, unicode, cast_bytes



import json

LOG_LEVELS = (logging.DEBUG, logging.INFO,
              logging.WARN, logging.ERROR, logging.CRITICAL)


class PUBLRHandler(logging.Handler):
    """A slightly more advanced logging handler that emits log messages through a PUB socket.
    Differs from the standard PUBHandler in that it serializes the full python logger logrecord before sending to SUB.

    Takes a PUB socket already bound to interfaces or an interface to bind to.

    Example::

        sock = context.socket(zmq.PUB)
        sock.bind('inproc://log')
        handler = PUBLRHandler(sock)

    Or::

        handler = PUBLRHandler('inproc://loc')

    These are equivalent.

    Log messages handled by this handler are broadcast with ZMQ topics
    ``this.root_topic`` comes first, followed by the log level
    (DEBUG,INFO,etc.), followed by any additional subtopics specified in the
    message by: log.debug("subtopic.subsub::the real message")
    """
    root_topic = ""
    socket = None

    def __init__(self, interface_or_socket, context=None):
        logging.Handler.__init__(self)
        if isinstance(interface_or_socket, zmq.Socket):
            self.socket = interface_or_socket
            self.ctx = self.socket.context
        else:
            self.ctx = context or zmq.Context()
            self.socket = self.ctx.socket(zmq.PUB)
            self.socket.bind(interface_or_socket)


    def serialize(self, record):
        if record.exc_info:
            # replace msg with exception information since exc_info cannot be easily converted into JSON
            record.msg = record.msg + str(traceback.format_exception(record.exc_info[0], record.exc_info[1], record.exc_info[2]))
            record.exc_info = None
        return json.dumps(record.__dict__)

    def emit(self, record):
        """Emit a log message on my socket."""
        try:
            topic, record.msg = record.msg.split(TOPIC_DELIM, 1)
        except Exception:
            topic = ""
        try:
            bmsg = cast_bytes(self.serialize(record))
        except Exception:
            self.handleError(record)
            return

        topic_list = []

        if self.root_topic:
            topic_list.append(self.root_topic)

        topic_list.append(record.levelname)

        if topic:
            topic_list.append(topic)

        btopic = b'.'.join(cast_bytes(t) for t in topic_list)

        self.socket.send_multipart([btopic, bmsg])


def log_worker(port, interval=1, level=logging.DEBUG):
    ctx = zmq.Context()
    pub = ctx.socket(zmq.PUB)
    pub.connect('tcp://127.0.0.1:%i' % port)

    logger = logging.getLogger()
    logger.setLevel(level)
    handler = PUBLRHandler(pub)
    logger.addHandler(handler)
    print("starting logger in main worker client")

    run = True
    while run:
        try:
            level = random.choice(LOG_LEVELS)
            sendmsg = "Hello from Main Worker Client!! "
            print('About to log : %s' % (sendmsg))
            logger.log(level, sendmsg)
            time.sleep(interval)
        except KeyboardInterrupt:
            run = False
            logger.log(logging.INFO, 'Client is stopping...end of messages')
            


def custom_exception(exc_type, exc_value, exc_traceback):
    logger = logging.getLogger(__name__)
    logger.exception('An unknown/uncaught exception occurred:', exc_info=(exc_type, exc_value, exc_traceback))
    sys.__excepthook__(exc_type, exc_value, exc_traceback)

if __name__ == '__main__':
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    else:
        n = 2

    if len(sys.argv) > 2:
        port = int(sys.argv[2])
    else:
        port = 5558

    # start the log generator
    log_worker(port)

