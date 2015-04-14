#!/usr/bin/env python


import os, sys

filename='rh.tex'
search_term = "\\bibnote{"
search_term = "\\footnote{"
s = open(filename).read()

i = 0
while True:
    i = s.find(search_term, i)
    if i == -1:
        break
    i += len(search_term)
    i0 = i
    paren_count = 1
    while paren_count > 0:
        if s[i] == '{':
            paren_count += 1
        elif s[i] == '}':
            paren_count -= 1
        i += 1
    j = s[i0:i].find("\\index")
    if j != -1:
        print '\n' + s[i0+j-50:i0+j+50]+'-'*70+'\n'


