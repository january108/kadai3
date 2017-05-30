#!/bin/sh

if [ $# -lt 2 ]; then
  echo "自然数を２つ指定してください"
  exit 1
fi

chk=`echo -n $1$2 | sed 's/[0-9]//g'`
if [ -n "$chk" ] ; then
  echo "自然数を指定してください"
  exit 1
elif [ $1 -le 0 -o $2 -le 0 ]; then
  echo "自然数を指定してください"
  exit 1
fi

smaller=$1
larger=$2
if [ $1 -ge $2 ]; then
  smaller=$2
  larger=$1
fi

while true; do
  mod=$(($larger%$smaller))
  if [ $mod -eq 0 ]; then
     echo $smaller
     exit 0
  fi
  larger=$(($smaller))
  smaller=$(($mod))
done;

