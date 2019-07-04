"""
Simple example of using zmq log handlers
This starts a number of subprocesses with PUBLRHandlers that generate
log messages at a regular interval.  The main process has a SUB socket,
which aggregates and logs all of the messages to the root logger.
"""

import logging
from multiprocessing import Process
import os
import random
import sys
import time

import zmq
from zmq.log.handlers import PUBLRHandler, TopicLogger

LOG_LEVELS = (logging.DEBUG, logging.INFO,
              logging.WARN, logging.ERROR, logging.CRITICAL)

TOPICS = ('A', 'B', 'C')



def log_worker(port, interval=1, level=logging.DEBUG):
    ctx = zmq.Context()
    pub = ctx.socket(zmq.PUB)
    pub.connect('tcp://127.0.0.1:%i' % port)

    logger = logging.getLogger(str(os.getpid()))
    logger.setLevel(level)
    handler = PUBLRHandler(pub)
    logger.addHandler(handler)

    print("starting logger at %i with level=%s" % (os.getpid(), level))

    while True:
        level = random.choice(LOG_LEVELS)
        print(f'Creating logger message: {level}-Hello from {os.getpid()}!')
        logger.log(level, "Hello from %i!" % os.getpid())
        time.sleep(interval)

def log_worker_with_topic(port, interval=1, level=logging.DEBUG):
    ctx = zmq.Context()
    pub = ctx.socket(zmq.PUB)
    pub.connect('tcp://127.0.0.1:%i' % port)

    logger = TopicLogger(str(os.getpid()))
    logger.setLevel(level)
    handler = PUBLRHandler(pub)
    logger.addHandler(handler)
    print("starting logger at %i with level=%s" % (os.getpid(), level))

    while True:
        level = random.choice(LOG_LEVELS)
        topic = random.choice(TOPICS)
        logger.log(level, topic, "Hello from %i!" % os.getpid())
        time.sleep(interval)


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

    # start the log generators
    workers = [Process(target=log_worker_with_topic, args=(port,), kwargs=dict(level=random.choice(LOG_LEVELS)))
               for i in range(n)]
    [w.start() for w in workers]

    # start the log watcher
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        pass
    finally:
        [w.terminate() for w in workers]