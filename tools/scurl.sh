#!/bin/bash

FILES=$@
CNT=1

read -s -p "Password for username $USER: " PASSWORD; echo
while true
do
    # vypis cyklu at vim, ze se neco deje
    echo -ne "\e[1K\rCyklus:$CNT"

    for FILE in $FILES
    do
        # hodime si to do subshellu, aby nas to zbytecne nebuzerovalo
        (
            OUTPUT=`echo $FILE | sed "s/https*:\/\/\([^.]*\.[^.]*\).*\/\(.*\)/\1-\2/g"`

            # v aktualnim adresari vytvorime namedpipe
            rm pipe.* 2> /dev/null
            mkfifo pipe.$$

            # nastvime curl a pockame si na predani jmena a hesla pres trubku
            curl "$FILE" -k --silent --fail --output "$OUTPUT" -C- --config pipe.$$ &
            PID=$!

            # zapiseme do trubky jmeno a heslo a potom trubku smazeme
            echo -e "--user $USER:$PASSWORD\n" > pipe.$$
            rm -f pipe.$$

            # pockame az proces skonci a jede se dal
            wait $PID
        )
    done

    CNT=$((CNT+1))
    sleep 1
done
