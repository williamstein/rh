#!/usr/bin/env python

# Takes a file and a phrase as input, then
# searches for every occurrence of the phrase in the file, and if the line
# doesn't contain \index{phrase}, adds that immediately after the phrase
# (so at most once per line).

import os, sys

if len(sys.argv) < 3:
    sys.stderr.write("%s: [filename.tex] '[phrase]' '[phrase2]' ...\n"%(sys.argv[0]))
    sys.exit(1)

def index_phrase(filename, phrase):
    s = ''
    index        = '\\index{%s}'%phrase
    phrase_lower = phrase.lower()
    index_lower  = index.lower()
    v = []
    for r in open(filename).readlines():
        r_lower = r.lower()
        if phrase_lower in r_lower and index_lower not in r_lower:
            i = r_lower.index(phrase_lower)
            if i != -1:  # it can't be -1...
                j = r_lower[i+len(phrase):].find(' ')
                #print i, j
                if j == -1:
                    j = i+len(phrase)
                else:
                    j = i+len(phrase) + j
                r = r[:j] + index + r[j:]
                print r
        v.append(r)
    open(filename,'w').write(''.join(v))

filename = sys.argv[1]
for phrase in sys.argv[2:]:
    index_phrase(filename, phrase)


