#!/bin/bash

UDERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne o ]; then
  echo "error:please run this script with root user"
  exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo "error:installing $2 ...$R failure $N"
    else
       echo "installing $2 ...$G success $N"
    fi       
}

dnf list installed mysql
#install if it is not found
if [ $? -ne 0 ];then
   dnf install mysql -y
   VALIDATE $? "mysql"
else
   echo "mysql already exit ... $Y skipping $N"
fi

dnf list installed nginx
#install if it is not found
if [ $? -ne 0 ];then
   dnf install nginx -y
   VALIDATE $? "nginx"
else
   echo "nginx already exit ... $Y skipping $N"
fi

dnf list installed python3
#install if it is not found
if [ $? -ne 0 ];then
   dnf install python3 -y
   VALIDATE $? "python3"
else
   echo "python3 already exit ... $Y skipping $N"
fi