#!/bin/bash

_W_DEVICE=${_W_DEVICE:-en0}

case "$fn" in
    "info")
        uname -a
    ;;

    "lock")
        gnome-screensaver-command -l
    ;;

    "restart")
        reboot
    ;;

    "sleep")
        systemctl hibernate
    ;;

    "shutdown")
        sudo shutdown -h 0
    ;;

    "uptime")
        uptime
    ;;

    "mem")
        htop
    ;;

    # list of used ports
    "ports")
        echo "Getting list of used ports..."
        sudo lsof -iTCP -sTCP:LISTEN -P
    ;;

    "ip.loc")
        local_ip=$(hostname -I)
        if [ $? != 0 ]; then
            local_ip=$(hostname -I)
        fi

        echo "Your local IP address is: ${local_ip}"
    ;;

    "ip.pub")
        echo "Your public IP address is: $(wget http://ipinfo.io/ip -qO -)"
    ;;

    # show the clock at the top right of the terminal
    "clock")
        date
    ;;

    "fd.size")
        echo "Calculating folder size..."
        echo "Folder size:"
        du -sh .
    ;;

    "fd.hid")
        ls -a|grep "^\."
    ;;

    "md5")
        if [ ! -z "$firstParameter" -a "$firstParameter" != " " ]; then
            md5sum $firstParameter
        else
            echo "Please specify a file to calculate the MD5"
        fi
    ;;

esac
