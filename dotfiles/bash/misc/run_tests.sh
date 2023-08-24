#!/bin/bash
# run_test.sh
#
#   Run project 4 test_case specified by $1

# Exit on error
set -e

[ "$#" -ne 1 ] && echo "Usage: ./run_test <binary_test_case>" && exit 1
! [ -f "$1" ] && echo "Test case specified does not exist." && exit 1

test_case="$1"

# Set 482 infrastructure
echo "Creating file system"
export FS_CRYPT=CLEAR
./createfs

echo "Building server..."
make server >/dev/null

echo "Running server in background"

exec 3< <(./server < input.txt &)

echo "Calculating server port"
port=`head -4 <&3`
port=${port##* }

echo "Running ${test_case}:"
echo -e "\n---------------------\n"
./$test_case localhost $port

cat <&3
