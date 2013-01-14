#!/bin/bash
# append text to doing.txt
# add date header if new day
# Jon Anhold <jon@anhold.com> 2012-04-19
#

DOING="/Users/jon.anhold/Dropbox/doing.taskpaper"
DATE=`date "+%A %m/%d/%Y:"`

grep -q "$DATE" $DOING 
RET=$?
if [ $RET -eq 0 ]; then
    echo -e "\t- $*" >> $DOING
else
    echo $DATE >> $DOING
    echo -e "\t- $*" >> $DOING
fi

ENTRY=`tail -1 $DOING`
echo "Added: $ENTRY"
