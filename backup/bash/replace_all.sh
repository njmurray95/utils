#!/bin/bash
#
# Run a find-replace recursively on an entire repository
set -e

DIR="$1"
FIND="$2"
REPLACE="$3"

if [[ ! -d "$DIR" || $# != 3 ]]; then
    echo "Usage: $0 <DIR> <FIND> <REPLACE>"
    exit 1
fi

# TODO: FZF-ify this
FILES=`ag --files-with-matches --break "$FIND" "$DIR" 2>/dev/null`

echo "Replacing '$FIND' with '$REPLACE' in all these files..."
echo $FILES | xargs -n1

echo "Continue?"
read -p "[y/n] " ans
case $ans in
    [Yy]* )
        ;;
    [Nn]* )
        exit 0
        ;;
    *)
        exit 1
        ;;
esac

echo $FILES | xargs -n1 sed -i "s/$FIND/$REPLACE/g"
