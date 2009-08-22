##############################################################
# Drawing figures (one or all)
##############################################################        

def draw(fig=None, dir='illustrations/',ext='pdf'):
    if isinstance(fig, str):
        print "Drawing %s... "%fig,
        sys.stdout.flush()
        t = walltime()
        eval('fig_%s(dir,ext)'%fig)
        print " (time = %s seconds)"%walltime(t)
        return
    
    if fig is None:
        figs = [x.split('_')[1] for x in globals() if x.startswith('fig_')]
    elif isinstance(fig, list):
        figs = fig
    for fig in figs:
        draw(fig)
    return

##############################################################
# Similar rates of growth
##############################################################        

def fig_simrates(dir,ext):
    # similar rates 
    G = similar_rates()
    G.save(dir + "/similar_rates.%s"%ext,figsize=[8,3])

def similar_rates():
    """
    Draw figure fig:simrates illustrating similar rates.

    EXAMPLES::

        sage: similar_rates()
    """
    var('X')
    A = 2*X^2 + 3*X - 5
    B = 3*X^2 - 2*X + 1
    G = plot(A/B, (1,100))
    H = plot(A, (X,1,100), rgbcolor='red') + plot(B, (X,1,100))
    a = graphics_array([[H,G]]) 
    return a

##############################################################
# Bag of primes
##############################################################        

def bag_of_primes(steps):
    """
    This works up to 9.  It took a day using specialized factoring
    (via GMP-ECM) to get step 10.

    EXAMPLES::
    
        sage: bag_of_primes(5)
        [2, 3, 7, 43, 13, 139, 3263443]
    """
    bag = [2]
    for i in range(steps):
        for p in prime_divisors(prod(bag)+1):
            bag.append(p)
    print bag


##############################################################
# Sieve of Eratosthenes
##############################################################        

def fig_erat(dir,ext):
    # sieving out 2,3,5,7
    for p in [2,3,5,7]:
        sieve_step(p,100).save(dir+'/sieve100-2.%s'%ext)

    sieve_step(13,200).save(dir+'/sieve200.%s'%ext)
        
        
def number_grid(c, box_args=None, font_args=None, offset=0):
    """
    INPUT:  
        c -- list of length n^2, where n is an integer.
             The entries of c are RGB colors.
        box_args -- additional arguments passed to box.
        font_args -- all additional arguments are passed
                to the text function, e.g., fontsize.
        offset -- use to fine tune text placement in the squares
        
    OUTPUT:
        Graphics -- a plot of a grid that illustrates 
             those n^2 numbers colored according to c.
    """
    if box_args is None: box_args = {}
    if font_args is None: font_args = {}
    
    try:
        n = sqrt(ZZ(len(c)))
    except ArithmeticError:
        raise ArithmeticError, "c must have square length"
    G = Graphics()
    k = 0
    for j in reversed(range(n)):
        for i in range(n):
            col = c[int(k)]
            R = line([(i,j),(i+1,j),(i+1,j+1),(i,j+1),(i,j)],
                     thickness=.2, **box_args)
            d = dict(box_args)
            if 'rgbcolor' in d.keys():
                del d['rgbcolor']
            P = polygon([(i,j),(i+1,j),(i+1,j+1),(i,j+1),(i,j)],
                        rgbcolor=col, **d)
            G += P + R
            if col != (1,1,1):
                G += text(str(k+1), (i+.5+offset,j+.5), **font_args)
            k += 1
    G.axes(False)
    G.xmin(0); G.xmax(n); G.ymin(0); G.ymax(n)
    return G

def sieve_step(p, n, gone=(1,1,1), prime=(1,0,0), \
               multiple=(.6,.6,.6), remaining=(.9,.9,.9), 
               fontsize=11,offset=0):
    """
    Return graphics that illustrates sieving out multiples of p.
    Numbers that are a nontrivial multiple of primes < p are shown in
    the gone color.  Numbers that are a multiple of p are shown in a
    different color.  The number p is shown in yet a third color.
  
    INPUT:
        p -- a prime (or 1, in which case all points are colored "remaining")
        n -- a SQUARE integer
        gone -- rgb color for integers that have been sieved out
        prime -- rgb color for p
        multiple -- rgb color for multiples of p
        remaining -- rgb color for integers that have not been sieved out yet
                     and are not multiples of p.
    """
    if p == 1:
        c = [remaining]*n
    else:
        exclude = prod(prime_range(p))  # exclude multiples of primes < p
        c = []
        for k in range(1,n+1):
            if k <= p and is_prime(k):
                c.append(prime)
            elif k == 1 or (gcd(k,exclude) != 1 and not is_prime(k)):
                c.append(gone)
            elif k%p == 0:
                c.append(multiple)
            else:
                c.append(remaining) 
        # end for
    # end if
    return number_grid(c,{'rgbcolor':(0.2,0.2,0.2)},{'fontsize':fontsize, 'rgbcolor':(0,0,0)},offset=offset)


##############################################################
# Proportion of Primes to to X
##############################################################

def fig_proportion_primes(dir,ext):
    for bound in [100,1000,10000]:
        g = proportion_of_primes(bound)
        g.save(dir + '/proportion_primes_%s.%s'%(bound,ext))

def plot_step_function(v, **args):
    r"""
    Return the line that gives the plot of the step function f defined
    by the list v of pairs (a,b).  Here if (a,b) is in v, then f(a) = b.

    INPUT:

        - `v` -- list of pairs (a,b)

    EXAMPLES::

        sage: plot_step_function([(i,sin(i)) for i in range(5,20)])
    """
    # make sorted copy of v (don't change in place, since that would be rude).
    v = list(sorted(v))
    if len(v) <= 1:
        return line([]) # empty line
    w = []
    for i in range(len(v)):
        w.append(v[i])
        if i+1 < len(v):
            w.append((v[i+1][0],v[i][1]))
    return line(w, **args)

def proportion_of_primes(bound, **args):
    """
    Return a graph of the step function that assigns to X the
    proportion of numbers between 1 and X of primes.

    INPUTS:
    
        - `bound` -- positive integer

        - additional arguments are passed to the line function.

    EXAMPLES::

        sage: proportion_of_primes(100)
    """
    v = []
    k = 0
    for n in range(1,bound+1):
        if is_prime(n):
            k += 1
        v.append((n,k/n))
    return plot_step_function(v, **args)


##############################################################
# Prime Gaps
##############################################################        

@cached_function
def prime_gaps(maxp):
    """
    Return the sequence of prime gaps obtained using primes up to maxp.
    
    EXAMPLES::
    
        sage: prime_gaps(100)
        [1, 2, 2, 4, 2, 4, 2, 4, 6, 2, 6, 4, 2, 4, 6, 6, 2, 6, 4, 2, 6, 4, 6, 8]        
    """
    P = prime_range(maxp+1)
    return [P[i+1] - P[i] for i in range(len(P)-1)]

@cached_function
def prime_gap_distribution(maxp):
    """
    Return list v such that v[i] is how many times i is a prime gap
    among the primes up to maxp.

    EXAMPLES::
    
        sage: prime_gap_distribution(100)
        [0, 1, 8, 0, 7, 0, 7, 0, 1]
        sage: prime_gap_distribution(1000)
        [0, 1, 35, 0, 40, 0, 44, 0, 15, 0, 16, 0, 7, 0, 7, 0, 0, 0, 1, 0, 1]
    """
    h = prime_gaps(maxp)
    v = [0]*(max(h)+1)
    for gap in h: v[gap] += 1
    return v    

def fig_primegapdist(dir,ext):
    v = prime_gap_distribution(10^7)[:50]
    bar_chart(v).save(dir+"/primegapdist.%s"%ext, figsize=[9,3])


##############################################################
# Multiplicatively even and odd table
##############################################################
def mult_even_odd_count(bound):
    """
    Return list v of length bound such that v[n] is a pair (a,b) where
    a is the number of multiplicatively even positive numbers <= n and b is the
    number of multiplicatively odd positive numbers <= n.

    INPUT:
    
        - ``bound`` -- a positive integer

    EXAMPLES::

    We make the table in the paper::

        sage: mult_even_odd_count(17)
        [(0, 0), (1, 0), (1, 1), (1, 2), (2, 2), (2, 3), (3, 3), (3, 4), (3, 5), (4, 5), (5, 5), (5, 6), (5, 7), (5, 8), (6, 8), (7, 8), (8, 8)]
    """
    par = mult_parities_python(bound)
    a = 0; b = 0
    v = [(a,b)]
    for n in range(1,bound):
        if par[n] == 0:  # mult even
            a += 1
        else:
            b += 1
        v.append((a,b))
    return v

def fig_multpar(dir,ext):
    for n in [10^k for k in reversed([1,2,3,4,5,6])]:
        file = dir + '/liouville-%s.%s'%(n,ext)
        if n >= 1000:
            time_series = True
        else:
            time_series = False
        g = race_mult_parity(n, time_series=time_series)
        g.save(file, frame=True)

def race_mult_parity(bound, time_series=False, **kwds):
    """
    Return a plot that shows race between multiplicatively even and
    odd numbers.  More precisely it shows the function f(X) that
    equals number of even numbers >= 2 and <=X minus the number of odd
    numbers >= 2 and <= X.

    EXAMPLES::

        sage: race_mult_parity(10^5,time_series=True)
        sage: race_mult_parity(10^5)
    """
    par = mult_parities_python(bound)[2:]
    if not time_series:
        v = [(2,0)]
        for n in range(bound-2):
            if par[n] == 0:
                b = v[-1][1]+1
            else:
                b = v[-1][1]-1
            v.append((v[-1][0], b))
            v.append((v[-1][0]+1, b))
        return line(v, **kwds)
    else:
        v = [0,0,0]
        for n in range(bound-2):
            if par[n] == 0:
                v.append(v[-1]+1)
            else:
                v.append(v[-1]-1)
        return finance.TimeSeries(v).plot()

def mult_parities_python(bound, verbose=False):
    """
    Return list v of length bound such that v[n] is 0 if n is
    multiplicative even, and v[n] is 1 if n is multiplicatively odd.
    Also v[0] is None.

    This goes up to bound=`10^7` in about 30 seconds.
    """
    v = [None]*bound
    v[0] = None
    v[1] = int(0)
    P = [int(p) for p in prime_range(bound)]
    for p in P:
        v[p] = int(1)
    last = P
    last_parity = int(1)
    loops = floor(log(bound,2))+1
    bound = int(bound)
    for k in range(loops):
        cur = []
        cur_parity = (last_parity+int(1))%int(2)
        if verbose:
            print "loop %s (of %s);  last = %s"%(k,loops, len(last))
        for n in last:
            for p in P:
                m = n * p
                if m >= bound:
                    break
                if v[m] is None:
                    v[m] = cur_parity
                    cur.append(m)
        last_parity = cur_parity
        last = cur
    return v


##############################################################
# Prime pi plots
##############################################################

def fig_prime_pi_aspect1(dir,ext):
    for n in [25, 100]:
        p = plot(lambda x: prime_pi(floor(x)), 1,n,
                 plot_points=10000,rgbcolor='red',
                 fillcolor=(.9,.9,.9),fill=True)
        file = dir + '/prime_pi_%s_aspect1.%s'%(n,ext)
        p.save(file, aspect_ratio=1)
        
def fig_prime_pi(dir,ext):
    for n in [1000, 10000, 100000]:
        p = plot(lambda x: prime_pi(floor(x)), 1,n,
                 plot_points=10000,rgbcolor='red',
                 fillcolor=(.9,.9,.9),fill=True)
        file = dir + '/prime_pi_%s.%s'%(n,ext)
        p.save(file)

def fig_prime_pi_nofill(dir,ext):
    for n in [25,100,1000,10000,100000]:
        g = plot_prime_pi(n, rgbcolor='red', thickness=2)
        g.save(dir + '/PN_%s.%s'%(n,ext))

def plot_prime_pi(n = 25, **args):
    v = [(0,0)]
    k = 0
    for p in prime_range(n+1):
        k += 1
        v.append((p,k))
    v.append((n,k))
    return plot_step_function(v, **args)
        
##############################################################
# Sieving
##############################################################

def fig_sieves(dir,ext):
    plot_three_sieves(200, shade=False).save(dir + '/sieve_2_200.%s'%ext, figsize=[9,3])
    plot_all_sieves(1000, shade=True).save(dir + '/sieve1000.%s'%ext,figsize=[9,3])

    m=100
    for z in [3,7]:
        save(plot_multiple_sieves(m,k=[z]) ,dir+'/sieves%s_100.%s'%(z,ext), xmax=m, figsize=[9,3])

def plot_sieve(n, x, poly={}, lin={}, label=True, shade=True):
    """
    Return a plot of the number of integer up to x that are coprime to n.
    These are the integers that are sieved out using the primes <= n.

    In n is 0 draw a graph of all primes. 
    """
    v = range(x+1)         # integers 0, 1, ..., x
    if n == 0:
        v = prime_range(x)
    else:
        for p in prime_divisors(n):
           v = [k for k in v if k%p != 0 or k==p]   
           # eliminate non-prime multiples of p
    v = set(v)
    j = 0 
    w = [(0,j)]
    for i in range(1,x+1):
        w.append((i,j))
        if i in v:
            j += 1
        w.append((i,j))
    w.append((i,0))
    w.append((0,0))
    if n == 0:
        t = "Primes"
        pos = x,.7*j
    elif n == 1:
        t = "All Numbers"
        pos = x, 1.03*j
    else:
        P = prime_divisors(n)
        if len(P) == 1:
            t = "Sieve by %s"%P[0]
        else:
            t = "Sieve by %s"%(', '.join([str(_) for _ in P]))
        pos = x,1.05*j
    F = line(w[:-2], **lin)
    if shade:
        F += polygon(w, **poly)
    if label:
        F += text(t, pos, horizontal_alignment="right", rgbcolor='black')
    return F

def plot_three_sieves(m, shade=True):
    s1 = plot_sieve(1, m, poly={'rgbcolor':(.85,.9,.7)},
                    lin={'rgbcolor':(0,0,0), 'thickness':1}, shade=shade)
    s2 = plot_sieve(2, m, poly={'rgbcolor':(.75,.8,.6)},
                    lin={'rgbcolor':(0,0,0),'thickness':1}, shade=shade)
    s3 = plot_sieve(0, m, poly={'rgbcolor':(1,.7,.5)},
                    lin={'rgbcolor':(1,0,0), 'thickness':1}, shade=shade)
    return s1+s2+s3

def plot_multiple_sieves(m=100, k = [2,3,5], shade=True):
    g = Graphics()
    n = len(k)
    for i in range(n):
        c = (1-float(i+1)/n)*0.666
        if k[i] == 0:
            z = 0
        else:
            z = prod(prime_range(k[i]+1))
        r = float(i)/n
        clr = (.85 + 0.15*r,0.9 -0.2*r, 0.9 -0.4*r)  
        if z == 0:
            clrlin=(1,0,0)
        else:
            clrlin=(0,0,0)
        s = plot_sieve(z, m, 
             poly={'rgbcolor':clr}, 
             lin={'rgbcolor':clrlin, 'thickness':1}, 
             label=(i==0 or i==n-1), shade=shade)
        g += s
    return g

def plot_all_sieves(x, shade=True):
    P = [1] + prime_range(int(sqrt(x))+1) + [0]
    G = plot_multiple_sieves(x, P, shade=shade)
    return G


##############################################################
# Area under plot of 1/log(x)
##############################################################

#auto
def area_under_inverse_log(m, **args):
    r"""
    This function returns a graphical illustration of `Li(x)` for `x
    \leq m` viewed as the integral of `1/\log(t)` from 2 to `t`.  We
    also plot primes on the `x`-axis and display the area as text.

    EXAMPLES::

    
    """
    f = plot(lambda x: 1/(log(x)),2,m)
    P = polygon([(2,0)]+list(f[0])+[(m,0)], hue=0.1,alpha=0.4)
    if False:
        T = sum([text(str(p),(p,-0.08),vertical_alignment="top",\
               horizontal_alignment="center", fontsize=6, rgbcolor=(.6,0,0)) \
            for p in prime_range(m+1)])
    else:
        T = Graphics()
    pr = sum([point((p,0), rgbcolor=(.6,0,0), pointsize=100/log(p)) for p in prime_range(m+1)])
    L = 'quad_qag(1/log(x), x, 2,%s, 0)'%m
    fs = 36
    area = text('Area ~ %f'%(float(maxima(L)[0])),(.5*m,.75),fontsize=fs,rgbcolor='black')
    primes = text('%s Primes'%len(prime_range(m+1)), (.5*m,-0.3),fontsize=fs,rgbcolor='black')
    fun = text('1/log(x)',(m/8,1.4),fontsize=fs,rgbcolor='black', horizontal_alignment='left')
    G = pr + f+P+area+T+primes +fun
    G.xmax(m+1)
    return G

def fig_inverse_of_log(dir,ext):
    for m in [30, 100, 1000]:
        area_under_inverse_log(m).save(dir+'/area_under_log_graph_%s.%s'%(m,ext), figsize=[7,7])

        
##############################################################
# Comparing Li, pi, and x/log(x)
##############################################################
def fig_li_pi_loginv(dir,ext):
    plot_li_pi_loginv(xmax=200).save(dir+'/three_plots.%s'%ext,figsize=[8,3])

def plot_li_pi_loginv(xmax=200):
    var('x')
    P = plot(x/log(x), (2, xmax))
    P+= plot(Li, (2, xmax), rgbcolor='black')
    P+= plot(prime_pi, 2, xmax, rgbcolor='red')
    return P



##############################################################
# Plots of Psi function
##############################################################


def plot_psi(xmax, **kwds):
    from math import log, pi
    v = [(0,0), (1,0), (1,log(2*pi))]
    y = v[-1][1]
    for pn in prime_powers(2,xmax+1):
        y += log(factor(pn)[0][0])
        v.append( (pn,y) )
    v.append((xmax,y))
    return plot_step_function(v, **kwds)

def fig_psi(dir,ext):
    for m in [10,200]:
        g = plot_psi(m, thickness=2)
        g.save(dir+'/psi_%s.%s'%(m,ext), aspect_ratio=1)
    g = plot(lambda x:x,1,1000,rgbcolor='red')+plot_psi(1000,alpha=0.8)
    g.save(dir+'/psi_diag_%s.%s'%(1000,ext),aspect_ratio=1)


##############################################################
# Sin, etc. waves
##############################################################

def fig_waves(dir,ext):
    g = plot(sin, -2.1*pi, 2.1*pi, thickness=2)
    g.save(dir+'/sin.%s'%ext)

    x = var('x')
    c = 5
    g = plot(sin(x), 0, c*pi) + plot(sin(329.0/261*x), 0, c*pi, color='red')
    g.save(dir+'/sin-twofreq.%s'%ext)

    g = plot(sin(x) + sin(329.0/261*x), 0, c*pi) 
    g.save(dir+'/sin-twofreq-sum.%s'%ext)

    c = 5
    g = plot(sin(x), 0, c*pi) + plot(sin(329.0/261*x + 0.4), 0, c*pi, color='red')
    g.save(dir+'/sin-twofreq-phase.%s'%ext)

    g = plot(sin(x) + sin(329.0/261*x + 0.4), 0, c*pi)
    g.save(dir+'/sin-twofreq-phase-sum.%s'%ext)

    f(x) = sin(x) + sin(329.0/261*x + 0.4)
    g = points([(i,f(i)) for i in [0,0.1,..,5*pi]])
    g.save(dir+'/sin-twofreq-phase-sum-points.%s'%ext)

    g = points([(i,f(i)) for i in [0,0.1,..,5*pi]])
    g += plot(f, (0, 5*pi), rgbcolor='black')
    g.save(dir+'/sin-twofreq-phase-sum-fill.%s'%ext)

    f(x) = 0.7*sin(x) + sin(329.0/261*x + 0.4)
    g = plot(f, (0, 5*pi))
    g.save(dir+'/sound-ce-general_sum.%s'%ext)

    B = bar_chart([0,0,0,0.7, 0, 1])
    B += text("C", (3.2,-0.05), rgbcolor='black', fontsize=18)
    B += text("D", (4.2,-0.05), rgbcolor='black', fontsize=18)
    B += text("E", (5.2,-0.05), rgbcolor='black', fontsize=18)
    B.save(dir+'/sound-ce-general_sum-blips.%s'%ext, axes=False, xmin=0, ymin=0)
    
    f(x) = 0.7*sin(x) + sin(329.0/261*x + 0.4) +  0.5*sin(300.0/261*x + 0.7) + 0.3*sin(1.5*x + 0.2) + 1.1*sin(4*x+0.1)
    g = plot(f, (0, 5*pi))
    g.save(dir + '/complicated-wave.%s'%ext)

##############################################################
# Sawtooth
##############################################################

def fig_sawtooth(dir,ext):
    g = plot_sawtooth(3)
    g.save(dir+'/sawtooth.%s'%ext, figsize=[10,2])
    
    g = plot_sawtooth_spectrum(18)
    g.save(dir+'/sawtooth-spectrum.%s'%ext, figsize=[8,3])

def plot_sawtooth(xmax):
    v = []
    for x in [0..xmax]:
        v += [(x,0), (x+1,1), (x+1,0)]
    return line(v)

def plot_sawtooth_spectrum(xmax):
    # the spectrum is a spike of height 1/k at k
    return sum([line([(k,0),(k,1/k)],thickness=3) for k in [1..xmax]])



##############################################################
# Plots of Fourier transform Phihat_even.
##############################################################

def fig_mini_phihat_even(dir,ext):
    f(t) = sum(-log(pn)/sqrt(pn) * cos(t*log(pn)) for pn in [2,3,4,5])
    G = plot(f, 1, 100, plot_points=10000)
    G.save(dir + "/mini_phihat_even.%s"%ext, figsize=[9,3], ymin=0)

def fig_phihat_even(dir,ext):
    for bound in [5, 20, 50, 500]:
        G = symbolic_phihat(bound, 2, 100,
                            plot_points=10^5)
        G.save(dir+'/phihat_even-%s.%s'%(bound,ext), figsize=[9,3], ymin=0)    

def symbolic_phihat(bound, xmin, xmax, plot_points=1000):
    f(t) = sum(-log(pn)/sqrt(pn) * cos(t*log(pn)) for pn in prime_powers(bound))
    P = plot(f, (t,xmin, xmax), plot_points=plot_points)
    ym = P.ymax()
    Z = []
    for y in zeta_zeros():
        if y > xmax: break
        Z.append(y)
    zeros = sum([arrow((x,ym),(x,0),rgbcolor='red',width=0.5,arrowsize=2)
                 for i, x in enumerate(Z)])
    return P + zeros



##############################################################
# Calculus pictures
##############################################################

def fig_calculus(dir,ext):
    x = var('x')
    f = (x-1)^2 - 1
    f_slope = f.derivative(x)
    P = plot(f, -1, 3, rgbcolor=(0,0,1), thickness=1.5, label="a function")
    Q = plot(f_slope, -1, 3, rgbcolor=(1,0,0), label="derivative")
    S = line([(2,0),(2,f_slope(x=2)),(0,f_slope(x=2))], thickness=0.5, rgbcolor='black')
    T = line([(1,-2),(3,2)], rgbcolor=(0,0.5,0)) + text("slope line", (3.1,2), horizontal_alignment='left')
    W = point((2,0), pointsize=40)
    G = W + P + Q + S + T
    G.save(dir + '/graph_slope_deriv.%s'%ext, figsize=[7,7],xmin=-2,xmax=4.5,ymin=-2,ymax=4.5)

def fig_jump(dir,ext):
    # straight jump
    v = line( [(0,1), (3,1), (3,2), (6,2)], thickness=2)
    v.ymin(0)
    v.save(dir + '/jump.%s'%ext)

    # smooth approximation to a jump
    e = .7
    v = line( [(0,1), (3-e,1)], thickness=2) + line([(3+e,2), (6,2)], thickness=2)
    v.ymin(0)
    S = spline( [(3-e,1), (3-e+e/20, 1), (3,1.5), (3+e-e/20, 2), (3+e,2)] )
    v += plot(S, (3-e, 3+e), thickness=2)
    v.save(dir + '/jump-smooth.%s'%ext)

    # derivatives of smooth jumps
    for e in ['7', '2', '05', '01']:
        g = smoothderiv(float('.'+e))
        g.save(dir + '/jump-smooth-deriv-%s.%s'%(e,ext))


def smoothderiv(e):
    def deriv(f, delta):
        # return very approximate numerical derivative of callable f, using
        # a given choice of delta
        def g(x):
            return (f(x + delta) - f(x))/delta
        return g
    
    v = line( [(0,1), (3-e,1)], thickness=2) + line([(3+e,2), (6,2)], thickness=2)
    v.ymin(0)
    S = spline( [(3-e,1), (3-e+e/20, 1), (3,1.5), (3+e-e/20, 2), (3+e,2)] )
    v += plot(S, (3-e, 3+e), thickness=2)
    D = (line( [(0,0), (3-e,0)], rgbcolor='red', thickness=2) +
         line([(3+e,0), (6,0)], rgbcolor='red', thickness=2))
    D += plot( deriv(S, e/30), (3-e, 3+e), rgbcolor='red', thickness=2)
    v += D
    return v

