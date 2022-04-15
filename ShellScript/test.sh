#!/bin/sh

INTERVAL_DAY=3
NOWDAY=`date +%d`

echo "今日は $NOWDAY 日"

AMARI=`expr $NOWDAY % $INTERVAL_DAY`

if [ $AMARI -eq 0 ]; then
  echo "$INTERVAL_DAY の倍数"
else
  echo "$INTERVAL_DAY 以外"
fi

echo "---"

func() {
  AMARI=`expr $1 % $INTERVAL_DAY`
  if [ $AMARI -eq 0 ]; then
    echo "$1 $INTERVAL_DAY の倍数"
  else
    echo "$1 $INTERVAL_DAY 以外"
  fi
}
#val = fanc()

for i in `seq 1 $NOWDAY`
do
  func $i
done