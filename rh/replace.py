#!/usr/bin/env python
import sys
a = open('rh.tex').read().replace(sys.argv[1],sys.argv[2])
open('rh.tex','w').write(a)
