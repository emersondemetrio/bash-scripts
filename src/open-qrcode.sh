DATA=$1
if [ -z "$DATA" ]; then
    echo "Usage: open-qrcode.sh <text> [size]"
    exit 1
fi

IMAGE_SIZE=$2
if [ -z "$IMAGE_SIZE" ]; then
    IMAGE_SIZE=300
fi

RESOLUTION="${IMAGE_SIZE}x${IMAGE_SIZE}"

open -a "Google Chrome" "https://api.qrserver.com/v1/create-qr-code/?size=$RESOLUTION&data=$DATA"
