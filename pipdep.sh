PACKAGE=$1
pip download $PACKAGE -d /tmp --no-binary :all:-v 2>&1 \
| grep Collecting \
| cut -d' ' -f2 \
| grep -Ev "$PACKAGE(~|=|\!|>|<|$)"