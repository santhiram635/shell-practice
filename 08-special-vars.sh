#!/bin/bash

echo "all variable passed to the script: $@"
echo "all variable passed to the script: $*"
echo "script name: $0"
echo "current directory: $PWD"
echo "who is running this: $user"
echo "home directory for user: $Home"
echo "PID of this script: $$"
sleep 15 &
echo "PID of the last command in the background: $!"