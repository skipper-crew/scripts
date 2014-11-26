#!/usr/local/bin/python2.7
import os

directory = '/home/mephius/img/catalog'
count =0
lists = []
sym = (0,1,2,3,4,5,6,7,8,9, 'a', 'b', 'c', 'd', 'e', 'f')
for test in sym:
    for test2 in sym:
	lists.append(str(test)+str(test2))
for dir1 in lists:
    log = open('/usr/home/script/img_clean/list_i2/'+dir1, "a")
    for dir2 in lists:
	pathfile = ('/list_i2/'+dir1+'/'+dir2+'/')
	path = (directory+pathfile)
	try:
	    for file in os.listdir(path):
		print>>log, pathfile + file
	except OSError:
	        pass

