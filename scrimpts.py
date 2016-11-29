# TAKE ALL FILES FROM A FOLDER AND SAVE THEM AS FOUR DIFFERENT FILES WITH FOUR DIFFERENT DIMENSIONS
import os, sys
import timeit
import uuid
import math
from PIL import Image
from os import listdir
from os.path import isfile, join


sizes = [{"name" : "banner",  "width" : 404, "height" : 200},
		 {"name" : "home",    "width" : 404, "height" : 227},
		 {"name" : "topic",   "width" : 620, "height" : 414},
		 {"name" : "action",  "width" : 133, "height" : 75}]
mypath = '/Users/kevincook/python/respondreact/respond-react-api/media/media/'
savepath = '/Users/kevincook/python/respondreact/respond-react-api/booya/'
dimensions = 128,128
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
i = 0;
for a in onlyfiles:
  ext = a.split('.')[1]
  newfilename = str(uuid.uuid1()) + '.' + ext
  try:
    for size in sizes:
      dimensions = (size['width'], size['height'])
      if not os.path.exists(savepath+size['name']):
        os.makedirs(savepath+size['name'])
        print(savepath+size['name'])
      z = Image.open(mypath+a)
      s = z.size; 
      ratio = size['width']/s[0];  
      print(ratio)
      print(str(s[0]) + ' ' + str(round(s[0]*ratio)))
      print(str(s[0]) + ' ' + str(round(s[1]*ratio)))
      z.thumbnail((round(s[0]*ratio), round(s[1]*ratio)), Image.ANTIALIAS)
      print('saving in ' + savepath + size['name'] + "/" + newfilename)
      z.save(savepath + size['name'] + "/" + a, 'JPEG' if ext.lower() == 'jpg' else ext)
      i = i + 1
  except Exception as e:
    print(str(z.filename) + ' ' + str(e))
    continue

print(i)