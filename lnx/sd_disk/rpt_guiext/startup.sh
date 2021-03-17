#!/bin/sh

function gpio_init()
{
    echo -n " TODO if any."
}

echo

case "$1" in
  start)
    echo -n "GPIO init"
    gpio_init
    echo "."
    /opt/bin/zynqconfig.sh &
    ;;
  stop)
    echo -n "Stopping RPT startup script"
    ;;
  *)
    echo "ERROR:$0: Wrong autostartup script parameter($1)"
    exit 1
esac

exit 0

