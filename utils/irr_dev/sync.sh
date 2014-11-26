#!/bin/sh

/usr/local/bin/rsync -av -e ssh mephius@192.168.1.7:/usr/home/mephius/irr.ru/utils/irr.ru/import/files/`date +%d.%m.%y`/_parser/ /usr/home/mephius/irr.ru/utils/irr.ru/import/files/`date +%d.%m.%y`/_parser/