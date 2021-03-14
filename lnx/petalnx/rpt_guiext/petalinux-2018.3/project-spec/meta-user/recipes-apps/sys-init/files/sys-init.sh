#!/bin/sh

### BEGIN INIT INFO
# Provides: Sys Startup script
# Required-Start:
# Required-Stop:
# Default-Start:S
# Default-Stop:
# Short-Description: Starts startup script upon boot
# Description:      Starts script that executes custom script /opt/bin/startup.sh.
### END INIT INFO

SCRIPT=/opt/bin/startup.sh
RUNAS=root
CMD="$SCRIPT $1"

test -e "$SCRIPT" || exit 0

case "$1" in
  start)
    echo -n "Starting Sys startup script"
    su -c "$CMD" $RUNAS
    echo "."
    ;;
  stop)
    echo -n "Stopping Sys startup script"
    su -c "$CMD" $RUNAS
    ;;
  *)
    echo "Usage: /etc/init.d/sys-init.sh {start|stop}"
    exit 1
esac

exit 0

