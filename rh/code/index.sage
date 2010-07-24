def doc():
    os.system('detex ../rh.tex > rh.txt')
    return open('rh.txt').read()

def not_dumb(x):
    for a in ['yet', 'you', 'width', 'approx']:
        if x.startswith(a): return False
    for a in ['ly', 'ing']:
        if x.endswith(a): return False
    for a in ['prove', 'propo', 'psi', '_', 'theorem', 'exercise', 'equation']:
        if a in x.lower(): return False
    return True

def words(exclude=True):
    d = doc()
    for a in '.?,:][)($0123456789!#/*+&=;\'`"':
        d = d.replace(a,'')
    if exclude:
        v = list(sorted(set(d.split())))
        v = [x for x in v if len(x) > 3 and not '-' in x]
        w = set([x.lower() for x in open('omit.txt').read().split()])
        v = [x for x in v if len(x) > 3 and x.lower() not in w]
        v = [x for x in v if '\336' not in x and '\325' not in x]
        v = [x for x in v if not_dumb(x)]
    else:
        v = d.split()
    return v

def write_list():
    v = words()
    open('list.txt','w').write('\n'.join(v))

def count():
    w = words(exclude=False)
    print "Words: ", len(w)
    r = open('../rh.tex').read()
    n = len(r.split('\\ill'))-1
    n += len(r.split('\\includegraphics'))-3
    print "Illustrations: ", n
