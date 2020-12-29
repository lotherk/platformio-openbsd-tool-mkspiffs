#!/bin/sh

VERSION="0.1"
ARCH=`uname -p`
OS=`uname -s | tr '[[:upper:]]' '[[:lower:]]'`

if [ ! -z $1 ]; then
    VERSION="$1"
fi

if [ ! -f "/usr/local/bin/mkspiffs" ]; then
	echo "Please install mkspiffs!"
	exit 1
fi

mkdir bin
ln -s /usr/local/bin/mkspiffs bin/mkspiffs

cat <<__EOF__ >package.json
{
    "description": "mkspiffs",
    "name": "tool-mkspiffs",
    "system": [
        "${OS}_${ARCH}"
    ],
	"url": "https://github.com/lotherk/platformio-openbsd-tool-mkspiffs",
    "version": "${VERSION}"
}
__EOF__
