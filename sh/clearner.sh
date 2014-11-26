#!/bin/sh

DAY=2
    while [ $DAY -lt 4 ]
	do 
	    /bin/rm -rf /usr/home/mephius/irr.ru/utils/irr.ru/import/files/`date -v-"$DAY"d +%d.%m.%y`
	    /bin/rm -rf /usr/home/autoexport/automania_irr/`date -v-"$DAY"d +%d.%m.%y`
	    DAYTR=`expr $DAY + 2`
	    /bin/rm -rf /usr/home/autoexport/trucklist_irr/`date -v-"$DAYTR"d +%d.%m.%y`
	    DAY=`expr $DAY + 1`
    done
    
find /usr/home/mephius/irr.ru/utils/irr.ru/files/bonus_realty -name "br*" -mtime +1 -exec rm {} \;
