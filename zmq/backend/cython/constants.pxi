#-----------------------------------------------------------------------------
# Python module level constants
#-----------------------------------------------------------------------------

VERSION = ZMQ_VERSION
VERSION_MAJOR = ZMQ_VERSION_MAJOR
VERSION_MINOR = ZMQ_VERSION_MINOR
VERSION_PATCH = ZMQ_VERSION_PATCH
NOBLOCK = ZMQ_NOBLOCK
DONTWAIT = ZMQ_DONTWAIT
POLLIN = ZMQ_POLLIN
POLLOUT = ZMQ_POLLOUT
POLLERR = ZMQ_POLLERR
SNDMORE = ZMQ_SNDMORE
STREAMER = ZMQ_STREAMER
FORWARDER = ZMQ_FORWARDER
QUEUE = ZMQ_QUEUE
IO_THREADS_DFLT = ZMQ_IO_THREADS_DFLT
MAX_SOCKETS_DFLT = ZMQ_MAX_SOCKETS_DFLT
PAIR = ZMQ_PAIR
PUB = ZMQ_PUB
SUB = ZMQ_SUB
REQ = ZMQ_REQ
REP = ZMQ_REP
DEALER = ZMQ_DEALER
ROUTER = ZMQ_ROUTER
PULL = ZMQ_PULL
PUSH = ZMQ_PUSH
XPUB = ZMQ_XPUB
XSUB = ZMQ_XSUB
UPSTREAM = ZMQ_UPSTREAM
DOWNSTREAM = ZMQ_DOWNSTREAM
STREAM = ZMQ_STREAM
EVENT_CONNECTED = ZMQ_EVENT_CONNECTED
EVENT_CONNECT_DELAYED = ZMQ_EVENT_CONNECT_DELAYED
EVENT_CONNECT_RETRIED = ZMQ_EVENT_CONNECT_RETRIED
EVENT_LISTENING = ZMQ_EVENT_LISTENING
EVENT_BIND_FAILED = ZMQ_EVENT_BIND_FAILED
EVENT_ACCEPTED = ZMQ_EVENT_ACCEPTED
EVENT_ACCEPT_FAILED = ZMQ_EVENT_ACCEPT_FAILED
EVENT_CLOSED = ZMQ_EVENT_CLOSED
EVENT_CLOSE_FAILED = ZMQ_EVENT_CLOSE_FAILED
EVENT_DISCONNECTED = ZMQ_EVENT_DISCONNECTED
EVENT_ALL = ZMQ_EVENT_ALL
EVENT_MONITOR_STOPPED = ZMQ_EVENT_MONITOR_STOPPED
globals()['NULL'] = ZMQ_NULL
PLAIN = ZMQ_PLAIN
CURVE = ZMQ_CURVE
EAGAIN = ZMQ_EAGAIN
EINVAL = ZMQ_EINVAL
EFAULT = ZMQ_EFAULT
ENOMEM = ZMQ_ENOMEM
ENODEV = ZMQ_ENODEV
EMSGSIZE = ZMQ_EMSGSIZE
EAFNOSUPPORT = ZMQ_EAFNOSUPPORT
ENETUNREACH = ZMQ_ENETUNREACH
ECONNABORTED = ZMQ_ECONNABORTED
ECONNRESET = ZMQ_ECONNRESET
ENOTCONN = ZMQ_ENOTCONN
ETIMEDOUT = ZMQ_ETIMEDOUT
EHOSTUNREACH = ZMQ_EHOSTUNREACH
ENETRESET = ZMQ_ENETRESET
HAUSNUMERO = ZMQ_HAUSNUMERO
ENOTSUP = ZMQ_ENOTSUP
EPROTONOSUPPORT = ZMQ_EPROTONOSUPPORT
ENOBUFS = ZMQ_ENOBUFS
ENETDOWN = ZMQ_ENETDOWN
EADDRINUSE = ZMQ_EADDRINUSE
EADDRNOTAVAIL = ZMQ_EADDRNOTAVAIL
ECONNREFUSED = ZMQ_ECONNREFUSED
EINPROGRESS = ZMQ_EINPROGRESS
ENOTSOCK = ZMQ_ENOTSOCK
EFSM = ZMQ_EFSM
ENOCOMPATPROTO = ZMQ_ENOCOMPATPROTO
ETERM = ZMQ_ETERM
EMTHREAD = ZMQ_EMTHREAD
IO_THREADS = ZMQ_IO_THREADS
MAX_SOCKETS = ZMQ_MAX_SOCKETS
MORE = ZMQ_MORE
IDENTITY = ZMQ_IDENTITY
SUBSCRIBE = ZMQ_SUBSCRIBE
UNSUBSCRIBE = ZMQ_UNSUBSCRIBE
LAST_ENDPOINT = ZMQ_LAST_ENDPOINT
TCP_ACCEPT_FILTER = ZMQ_TCP_ACCEPT_FILTER
PLAIN_USERNAME = ZMQ_PLAIN_USERNAME
PLAIN_PASSWORD = ZMQ_PLAIN_PASSWORD
CURVE_PUBLICKEY = ZMQ_CURVE_PUBLICKEY
CURVE_SECRETKEY = ZMQ_CURVE_SECRETKEY
CURVE_SERVERKEY = ZMQ_CURVE_SERVERKEY
ZAP_DOMAIN = ZMQ_ZAP_DOMAIN
RECONNECT_IVL_MAX = ZMQ_RECONNECT_IVL_MAX
SNDTIMEO = ZMQ_SNDTIMEO
RCVTIMEO = ZMQ_RCVTIMEO
SNDHWM = ZMQ_SNDHWM
RCVHWM = ZMQ_RCVHWM
MULTICAST_HOPS = ZMQ_MULTICAST_HOPS
IPV4ONLY = ZMQ_IPV4ONLY
ROUTER_BEHAVIOR = ZMQ_ROUTER_BEHAVIOR
TCP_KEEPALIVE = ZMQ_TCP_KEEPALIVE
TCP_KEEPALIVE_CNT = ZMQ_TCP_KEEPALIVE_CNT
TCP_KEEPALIVE_IDLE = ZMQ_TCP_KEEPALIVE_IDLE
TCP_KEEPALIVE_INTVL = ZMQ_TCP_KEEPALIVE_INTVL
DELAY_ATTACH_ON_CONNECT = ZMQ_DELAY_ATTACH_ON_CONNECT
XPUB_VERBOSE = ZMQ_XPUB_VERBOSE
FD = ZMQ_FD
EVENTS = ZMQ_EVENTS
TYPE = ZMQ_TYPE
LINGER = ZMQ_LINGER
RECONNECT_IVL = ZMQ_RECONNECT_IVL
BACKLOG = ZMQ_BACKLOG
ROUTER_MANDATORY = ZMQ_ROUTER_MANDATORY
FAIL_UNROUTABLE = ZMQ_FAIL_UNROUTABLE
ROUTER_RAW = ZMQ_ROUTER_RAW
IMMEDIATE = ZMQ_IMMEDIATE
IPV6 = ZMQ_IPV6
MECHANISM = ZMQ_MECHANISM
PLAIN_SERVER = ZMQ_PLAIN_SERVER
CURVE_SERVER = ZMQ_CURVE_SERVER
PROBE_ROUTER = ZMQ_PROBE_ROUTER
REQ_RELAXED = ZMQ_REQ_RELAXED
REQ_CORRELATE = ZMQ_REQ_CORRELATE
CONFLATE = ZMQ_CONFLATE
ROUTER_HANDOVER = ZMQ_ROUTER_HANDOVER
TOS = ZMQ_TOS
AFFINITY = ZMQ_AFFINITY
MAXMSGSIZE = ZMQ_MAXMSGSIZE
HWM = ZMQ_HWM
SWAP = ZMQ_SWAP
MCAST_LOOP = ZMQ_MCAST_LOOP
RECOVERY_IVL_MSEC = ZMQ_RECOVERY_IVL_MSEC
RATE = ZMQ_RATE
RECOVERY_IVL = ZMQ_RECOVERY_IVL
SNDBUF = ZMQ_SNDBUF
RCVBUF = ZMQ_RCVBUF
RCVMORE = ZMQ_RCVMORE

#-----------------------------------------------------------------------------
# Symbols to export
#-----------------------------------------------------------------------------
__all__ = [
  "VERSION",
  "VERSION_MAJOR",
  "VERSION_MINOR",
  "VERSION_PATCH",
  "NOBLOCK",
  "DONTWAIT",
  "POLLIN",
  "POLLOUT",
  "POLLERR",
  "SNDMORE",
  "STREAMER",
  "FORWARDER",
  "QUEUE",
  "IO_THREADS_DFLT",
  "MAX_SOCKETS_DFLT",
  "PAIR",
  "PUB",
  "SUB",
  "REQ",
  "REP",
  "DEALER",
  "ROUTER",
  "PULL",
  "PUSH",
  "XPUB",
  "XSUB",
  "UPSTREAM",
  "DOWNSTREAM",
  "STREAM",
  "EVENT_CONNECTED",
  "EVENT_CONNECT_DELAYED",
  "EVENT_CONNECT_RETRIED",
  "EVENT_LISTENING",
  "EVENT_BIND_FAILED",
  "EVENT_ACCEPTED",
  "EVENT_ACCEPT_FAILED",
  "EVENT_CLOSED",
  "EVENT_CLOSE_FAILED",
  "EVENT_DISCONNECTED",
  "EVENT_ALL",
  "EVENT_MONITOR_STOPPED",
  "NULL",
  "PLAIN",
  "CURVE",
  "EAGAIN",
  "EINVAL",
  "EFAULT",
  "ENOMEM",
  "ENODEV",
  "EMSGSIZE",
  "EAFNOSUPPORT",
  "ENETUNREACH",
  "ECONNABORTED",
  "ECONNRESET",
  "ENOTCONN",
  "ETIMEDOUT",
  "EHOSTUNREACH",
  "ENETRESET",
  "HAUSNUMERO",
  "ENOTSUP",
  "EPROTONOSUPPORT",
  "ENOBUFS",
  "ENETDOWN",
  "EADDRINUSE",
  "EADDRNOTAVAIL",
  "ECONNREFUSED",
  "EINPROGRESS",
  "ENOTSOCK",
  "EFSM",
  "ENOCOMPATPROTO",
  "ETERM",
  "EMTHREAD",
  "IO_THREADS",
  "MAX_SOCKETS",
  "MORE",
  "IDENTITY",
  "SUBSCRIBE",
  "UNSUBSCRIBE",
  "LAST_ENDPOINT",
  "TCP_ACCEPT_FILTER",
  "PLAIN_USERNAME",
  "PLAIN_PASSWORD",
  "CURVE_PUBLICKEY",
  "CURVE_SECRETKEY",
  "CURVE_SERVERKEY",
  "ZAP_DOMAIN",
  "RECONNECT_IVL_MAX",
  "SNDTIMEO",
  "RCVTIMEO",
  "SNDHWM",
  "RCVHWM",
  "MULTICAST_HOPS",
  "IPV4ONLY",
  "ROUTER_BEHAVIOR",
  "TCP_KEEPALIVE",
  "TCP_KEEPALIVE_CNT",
  "TCP_KEEPALIVE_IDLE",
  "TCP_KEEPALIVE_INTVL",
  "DELAY_ATTACH_ON_CONNECT",
  "XPUB_VERBOSE",
  "FD",
  "EVENTS",
  "TYPE",
  "LINGER",
  "RECONNECT_IVL",
  "BACKLOG",
  "ROUTER_MANDATORY",
  "FAIL_UNROUTABLE",
  "ROUTER_RAW",
  "IMMEDIATE",
  "IPV6",
  "MECHANISM",
  "PLAIN_SERVER",
  "CURVE_SERVER",
  "PROBE_ROUTER",
  "REQ_RELAXED",
  "REQ_CORRELATE",
  "CONFLATE",
  "ROUTER_HANDOVER",
  "TOS",
  "AFFINITY",
  "MAXMSGSIZE",
  "HWM",
  "SWAP",
  "MCAST_LOOP",
  "RECOVERY_IVL_MSEC",
  "RATE",
  "RECOVERY_IVL",
  "SNDBUF",
  "RCVBUF",
  "RCVMORE",
]
