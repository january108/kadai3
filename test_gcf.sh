#!/bin/sh

tmp=/tmp/$$

ERROR_EXIT () { 
  echo "$1" >&2
  rm -f $tmp
  exit 1
}

###########################
# test1 calc successful 1 #
###########################
echo 3 > $tmp-ans
./gcf.sh 15 21 > $tmp-out || ERROR_EXIT "TEST1-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-2"
echo test1 OK

###########################
# test2 calc successful 2 #
###########################
echo 1 > $tmp-ans
./gcf.sh 10039 2 > $tmp-out || ERROR_EXIT "TEST2-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST2-2"
echo test2 OK

###########################
# test3 parameter error 1 #
###########################
echo "自然数を２つ指定してください" > $tmp-ans
./gcf.sh  > $tmp-out && ERROR_EXIT "TEST3-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST3-2"
echo test3 OK

###########################
# test4 parameter error 2 #
###########################
echo "自然数を２つ指定してください" > $tmp-ans
./gcf.sh 10 > $tmp-out && ERROR_EXIT "TEST4-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST4-2"
echo test4 OK

###########################
# test5 parameter error 3 #
###########################
echo "自然数を指定してください" > $tmp-ans
./gcf.sh 100.139 2 > $tmp-out && ERROR_EXIT "TEST5-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST5-2"
echo test5 OK

###########################
# test6 parameter error 4 #
###########################
echo "自然数を指定してください" > $tmp-ans
./gcf.sh -10 2 > $tmp-out && ERROR_EXIT "TEST6-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST6-2"
echo test6 OK

rm -f $tmp-*
exit 0

