#!/bin/bash

set -e

error(){
    echo "there is an error in $LINENO, command is: $BASH_COMMAND"
}

trap error ERR

echo "hello"
echo "before error"
cafqkJHlfh #here shell understands there is an error and singal in ERR
echo "after error"