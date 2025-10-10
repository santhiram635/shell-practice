#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

if [ $USERID -ne 0 ]; then
  echo "error:please run the script with root user"
fi

mkdir -p $LOGS_FOLDER
  echo "script started time at: $(date)" | tee -a $LOG_FILE

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo -e "installing $2 ...$R failure $N" &>>LOG_FILE
    else
      echo -e "installing $2... $G success $N" &>>LOG_FILE
    fi    
} 

dnf list installed mysql &>>LOG_FILE
  if [ $? -ne 0 ]; then
     dnf install mysql -y &>>LOG_FILE
     VALIDATE $? "mysql"
  else
     echo -e "mysql already exit ... $Y skipping $N" | tee -a $LOG_FILE
  fi

dnf list installed nginx &>>LOG_FILE
  if [ $? -ne 0 ]; then
     dnf install nginx -y &>>LOG_FILE
     VALIDATE $? "nginx"
  else
     echo -e "mysql already exit ... $Y skipping $N" | tee -a $LOG_FILE
  fi

dnf list installed python3 &>>LOG_FILE
  if [ $? -ne 0 ]; then
     dnf install python3 -y &>>LOG_FILE
     VALIDATE $? "python3"
  else
     echo -e "mysql already exit ... $Y skipping $N" | tee -a $LOG_FILE
  fi    