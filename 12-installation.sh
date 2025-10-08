#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "Error:please run this srcipt root previlege"
  exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
  echo "installing mysql is failure"
  exit 1
else
  echo "installing mysql is success"
fiw    