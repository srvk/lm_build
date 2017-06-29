#!/usr/bin/env python

# Apache 2.0

# For each input line, print the FSTs.
# input format is 'sentences' where each word was replaced by numeric index

import sys

fread = open(sys.argv[1], 'r')

for entry in fread.readlines():
    entry = entry.replace('\n','').strip()
    fields = entry.split(' ')

    for n in range(1, len(fields)+1):
        print str(n-1) + ' ' + str(n) + ' ' + fields[n-1] + ' ' + fields[n-1]

    print str(n) + ' ' + '0' + ' ' + '0' + ' ' + '0'  # assume that <eps> is 0 in words.txt    

print '0'

fread.close()
