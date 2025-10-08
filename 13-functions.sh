#!/bin/bash

UDERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "error:please run this script with root user"
  exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo "error:installing $2 is failure"
    else
       echo "installing $2 is success"
    fi       
}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install python3 -y
VALIDATE $? "python3"