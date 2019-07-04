"""
Simple example of using zmq logrecord pub 
Start the client and server. A logrecord is passed to SUB which can
then be formatted / processed to any number of logging
handlers.
"""


import sys
from datetime import datetime

import logging
from logging import INFO, DEBUG, WARN, ERROR, FATAL

import zmq
from zmq.utils.strtypes import bytes, unicode, cast_bytes
from zmq.log.handlers import TopicLogger

import json
import traceback


TOPIC_DELIM="::" # delimiter for splitting topics on the receiving end.

LOG_LEVELS = (logging.DEBUG, logging.INFO,
              logging.WARN, logging.ERROR, logging.CRITICAL)


def deserialize(msg):
    return json.loads(msg)

def sub_logger(port, level=logging.DEBUG):
    ctx = zmq.Context()
    sub = ctx.socket(zmq.SUB)
    sub.bind('tcp://127.0.0.1:%i' % port)
    sub.setsockopt(zmq.SUBSCRIBE, b"")
    logger = logging.getLogger()
    logger.setLevel(level)
    formatter = logging.Formatter('%(asctime)s,%(msecs)d %(levelname)s -- %(message)s')


    # send to screen:
    ch = logging.StreamHandler()
    ch.setLevel(logging.DEBUG)
    ch.setFormatter(formatter)
    logger.addHandler(ch)
    # and send to file 
    fh = logging.FileHandler(f'./ZMQ_pub.log')
    fh.setLevel(logging.DEBUG)
    fh.setFormatter(formatter)
    logger.addHandler(fh)

    while True:
        level, message = sub.recv_multipart()
        message = message.decode('ascii')
        message = deserialize(message)
        record = logging.makeLogRecord(message)
        logger.handle(record)



# Generate the methods of TopicLogger, since they are just adding a
# topic prefix to a message.
for name in "debug warn warning error critical fatal".split():
    meth = getattr(logging.Logger, name)
    setattr(TopicLogger, name,
            lambda self, level, topic, msg, *args, **kwargs:
            meth(self, level, topic + TOPIC_DELIM + msg, *args, **kwargs))


if __name__ == '__main__':
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
    else:
        n = 2

    if len(sys.argv) > 2:
        port = int(sys.argv[2])
    else:
        port = 5558

    # start the log watcher
    try:
        print(f'Starting ZMQ logger process listening to port {port}....Press CTRL C to terminate.')
        sub_logger(port)
    except KeyboardInterrupt:
        pass
    finally:
        pass