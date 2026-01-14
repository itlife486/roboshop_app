#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -eq 0 ] ; then

    echo -e  $2...$G "SUCCESS"

    else 

     echo -e $2 ...$R "FAILURE" 

}

int_libary ()
{
    VERSION=$2
dnf module disable $1 -y
 VALIDATE $? "Disabling " $1 
if [ -n $VERSION ] ; then 

   dnf module enable $1:$2 -y
   VALIDATE $? "Enabling" $1":"$2
 else 

   dnf module enable $1 -y
   VALIDATE $? "Enabling $1"

fi 

dnf install $1 -y 

 VALIDATE $? "Installing the " $1

}