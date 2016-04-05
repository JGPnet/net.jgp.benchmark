
import os

i=0
size=1024*1024*256

while True:
    i=i+1
    filename="/tmp/fio-testing/data/%05d.rawdata" % i
    print "Processing %s" % filename
    with open(filename, 'wb') as fout:
        j=0
        while (j<size/1024):
            fout.write(os.urandom(1024))
            j=j+1
    print "[done]" 
