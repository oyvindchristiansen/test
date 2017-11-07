#!/usr/bin/env python

import subprocess, json

smartdata = subprocess.Popen('cat test.data', stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

jsonS,_ = smartdata.communicate()

data = json.loads(jsonS)

#print(data[0])

#for disk in data:
#    for attribute, value in disk.iteritems():
#        print attribute, value

#print(data)

print data.items()
