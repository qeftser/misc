

if [ "$#" -ne 1 ]; then
	echo "usage: ${0} [ path/to/image ]"
fi

IMAGE=$1

( sleep 1; cat /dev/fb0 > /tmp/BACKGROUND.fbimg ; sleep 1; pkill fbi ) & fbi -t 2 -1 --noverbose -a "$IMAGE"

export FBTERM_BACKGROUND_IMAGE=1
clear
( cat /tmp/BACKGROUND.fbimg > /dev/fb0 &) > /dev/null; sleep 0.25; fbterm
