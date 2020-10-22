service dbus start
service avahi-daemon start

sleep 1

echo  "-> starting rpiplay <-"

NAME=${RPI_PLAY_NAME:=RPiPlay}
AUDIO=${RPI_PLAY_AUDIO:=hdmi}
EXTRA=${RPI_PLAY_EXTRA_ARGS}

./rpiplay -a $AUDIO -n $NAME $EXTRA