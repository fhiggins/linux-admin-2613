#!/bin/bash
# this script must be run a an administrator (sudo)

COURSE_NAME_SEMESTER=2612_2018f
GROUPS=students,$COURSE_NAME_SEMESTER

# todo - check that groups exist

# set internal field separator to something other than tab
  IFS=#

  while read inputline
    do
      lastname="$(echo $inputline | cut -f1)"
      firstname="$(echo $inputline | cut -f2)"
      login="$(echo $inputline | cut -f3)"
      email="$(echo $inputline | cut -f4)"
if grep $login /etc/passwd ; then
  echo "$login already is a user"
else
#echo "sudo useradd --base-dir /home -G $GROUPS --comment=\"$firstname $lastname, $email\" $login"
  sudo useradd --base-dir /home -G $GROUPS --comment="$firstname $lastname, $email" $login
fi
  done <2613_current.txt
  
