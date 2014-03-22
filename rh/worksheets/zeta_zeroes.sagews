︠ba85041a-9f6f-4845-9c51-f650cee93396︠
v = [float(a) for a in zeta_zeros()]
t = stats.TimeSeries(v)
︡eeafe7ea-0ec2-47f0-8bdc-05d7f91ef809︡
︠e2d5a651-6b1b-453e-b5a6-dd96e89c31cb︠
%timeit len(t.clip_remove(max=100))
︡4a72c70f-5da4-4d44-98bb-6e46006032bf︡{"stdout":"625 loops, best of 3: 256 µs per loop"}︡{"stdout":"\n"}︡
︠fb193fc1-d056-47ea-9637-397a44558a78︠
def zeta_pi(X):
    return len(t.clip_remove(max=X))
︡76b7b57b-2fed-4af2-9884-852a404720c7︡
︠0ba03eb7-e5f7-41af-85d7-29dcd8046e32︠
zeta_pi(20)
︡59ba199e-b741-4e69-9b45-fd943e65ef69︡{"stdout":"1\n"}︡
︠6e37ca5e-0c9c-44f2-97da-2624fb677d99︠
def g(n, **kwds):
    p = plot(zeta_pi, 1,n,
         plot_points=1000,rgbcolor='red',
         fillcolor=(.9,.9,.9),fill=True, **kwds)
    return p
︡eb4d542e-7ace-4f71-a596-42e37301441a︡
︠8dca2c7a-db7a-4683-84a8-e06dcdd0d2e6︠
g(30, thickness=2)
︡dd797bcc-e315-4a2a-a3fe-5ddf1a7ee695︡{"once":false,"file":{"show":true,"uuid":"c239eab0-0ab5-4ae3-945e-19ae03f2475c","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_68Zr8U.png"}}︡
︠58e75356-e671-499f-9be4-7fea6330c6fe︠
f(T) = T/(2*pi) * log(T/(2*pi*e))
g(50) + f.plot(1,50)
︡e159ff5a-55f2-4a53-b2ed-b498638de78c︡{"once":false,"file":{"show":true,"uuid":"5fd1860c-545d-4051-9291-79468f267ef2","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_41VeNG.png"}}︡
︠6ce86cba-1f81-4b04-b586-a8059ba93531︠
g(100) + f.plot(1,100)
︡51878013-6514-4434-9a92-147a7fba0ff4︡{"once":false,"file":{"show":true,"uuid":"98102735-6855-43f8-abb9-511dd1b3a3ef","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp__2m9KP.png"}}︡
︠c660dee2-854d-486d-9e3d-b65356211ccb︠
g(1000) + f.plot(1,1000)
︡6ac894af-7f98-4f7b-8462-6e57ff388533︡{"once":false,"file":{"show":true,"uuid":"496224dd-6291-4acc-b4a9-6359e9efbf60","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_zAPgIY.png"}}︡
︠f135f0f6-5872-4954-99f9-0adc39075fad︠

︠fab641af-b6b9-497c-971b-72094f300069︠

︠31487e02-e645-4ba9-93e7-bdf17b569659︠

︡1200af1b-1b48-46b2-b3d6-f26b3abc3d5f︡{"once":false,"file":{"show":true,"uuid":"ebd0de70-60b5-41a8-b103-9ec4d91c0baf","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_BRHMrB.png"}}︡
︠22b9c1b0-74fa-4970-ba36-d12edc3e93ea︠

︠1c52d33c-042e-4f56-a46a-be5cad78d266︠
def g(n, **kwds):
    t = stats.TimeSeries(v)[:n]
    x = [(0,0)]+ [(b,a+1) for a,b in enumerate(t.sums())]
    g = plot_step_function(x, **kwds)
    show(g)
︡24711195-5450-41e8-b988-1fceb266538b︡
︠80fd48e4-8105-47de-8b2f-ac49bb4b9b5e︠
g(5, thickness=3)
︡2e368952-5409-42ec-9268-ed0b5645d1f3︡{"once":false,"file":{"show":true,"uuid":"5e75efa3-a0bf-48e6-83b9-ce0d4d6c9ff7","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_7Kro4_.png"}}︡
︠4b43e885-9777-453b-a0a2-9d4e1e7d79da︠
g(10, thickness=2)
︡5d66681f-4dd1-4297-949e-6642371a07b8︡{"once":false,"file":{"show":true,"uuid":"7704eabe-000d-4963-b62c-aa7c3f6487c8","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_Plsvto.png"}}︡
︠c4db95cc-09eb-4bbc-9938-13eddd2085a6︠
g(100)
︡b1eee67f-5ea2-40e9-a69c-e22fb0a2a9a7︡{"once":false,"file":{"show":true,"uuid":"3679f56d-3597-49b5-a617-28204ec13ca5","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_GzDe8h.png"}}︡
︠fcbab5c0-0631-43e2-b742-7abe3f801892︠
g(1000,thickness=.5)
︡72402ee7-ec4d-49cb-b73b-ae5635855ad9︡{"once":false,"file":{"show":true,"uuid":"c03c88c2-44cc-4d19-a8cd-b3a9dd5c6252","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_WODUXx.png"}}︡
︠24ff5376-c7c9-43ea-aecc-9af2f06a58d7︠
g(100000)
︡974b52e4-fb21-46d1-aa68-63faafd184e9︡{"once":false,"file":{"show":true,"uuid":"442acc7e-bd88-4dbe-b3b6-1b12a0e2ac70","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_VOJlpe.png"}}︡
︠d0d20fa7-a7ef-42a0-87f3-8856621e27b0︠
t = stats.TimeSeries(v)
x = [(0,0)]+ [(b,a+1) for a,b in enumerate(t.sums())]
g = plot_step_function(x)
show(g,gridlines=True)
︡ffe4b7b6-3145-4564-933a-0445af97e84d︡{"once":false,"file":{"show":true,"uuid":"442acc7e-bd88-4dbe-b3b6-1b12a0e2ac70","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_qHjnMq.png"}}︡
︠650dfc44-b6f1-4c12-82bc-73b889541114︠






︠7bf5da7d-7fb4-495f-a920-f6c622b1294f︠
g = stats.TimeSeries(v).plot_histogram(bins=100, normalize=False); g
︡fb3373c5-f6fb-481b-8258-95c41055e66b︡{"once":false,"file":{"show":true,"uuid":"2cff625a-0ab2-4f2c-a167-d90b765bc503","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_DH7pTJ.png"}}︡
︠76cd4c03-5a64-4dc9-a2c8-50ac8a05d874︠
g.show(frame=True, axes=False)
︡70b894fb-d511-4e2c-a61e-0cf530cd8971︡{"once":false,"file":{"show":true,"uuid":"b61736ff-4f35-4761-a8ee-2ef3c421b3e2","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_IRbAtI.png"}}︡
︠3a559642-2ba3-4125-aa71-db9a76aa01da︠
f(T) = (T/(2*pi)) * log(T/(2*pi*e))
f1 = f.derivative(T)
h = g + (f1 * g.ymax()/f1(v[-1])).plot(2,70000,color='red')
h.show(frame=True, axes=False)
︡53e819ef-d317-4bd7-81f4-2465de6c7054︡{"once":false,"file":{"show":true,"uuid":"2039f657-1777-4229-b6ad-cc87a8997adf","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/8088/tmp_vLGVVt.png"}}︡
︠eb72d556-dc9a-460e-96f5-8550ea6f37c3︠
show(f)
︡fda9dc42-915d-4d1e-a184-0b0326aa1bce︡{"tex":{"tex":"T \\ {\\mapsto}\\ \\frac{T \\log\\left(\\frac{T e^{\\left(-1\\right)}}{2 \\, \\pi}\\right)}{2 \\, \\pi}","display":true}}︡
︠a1bd8566-8d5d-4911-8f41-02278a9452c2︠
N(f(74920.827498994))
︡4ff60bb1-5a01-47cc-8207-128b3c1dfe26︡{"stdout":"99998.5300884912\n"}︡
︠6ee23022-5d22-4af2-8667-7a698e0f0bf7︠
N(f(10100)-f(10000))
︡fc3e1666-e373-4774-b366-8066127cd713︡{"stdout":"117.415711316151\n"}︡
︠8516dbc1-0afc-4be4-afb2-63096ca7dd7a︠
N(f(10000))
︡03f1e864-f2cc-4245-80ba-59b643c312c4︡{"stdout":"10142.0903475268\n"}︡
︠a611c3ff-a538-4c7e-812c-138f541ac23f︠
show(f1)
︡bbc7678c-705d-4ce1-8dd4-2e4303619a34︡{"tex":{"tex":"T \\ {\\mapsto}\\ \\frac{\\log\\left(\\frac{T e^{\\left(-1\\right)}}{2 \\, \\pi}\\right)}{2 \\, \\pi} + \\frac{1}{2 \\, \\pi}","display":true}}︡
︠446d04ae-f392-40b8-b387-44eaeaf6afa2︠
N(f1(10000))
︡4dd1d913-c0be-4fa6-84e8-f1852b9d4a5a︡{"stdout":"1.17336397784458\n"}︡
︠31fbc3a7-0188-4ef3-9077-33ef688790b6︠
len(v)
︡373d150b-a2c1-4abd-b708-e805a201eb44︡{"stdout":"100000\n"}︡
︠66a85130-a710-4291-9e9a-3a9f446b3160︠
v[-1]
︡024d8bca-e300-4762-aee5-77720e8b361a︡{"stdout":"74920.827498994\n"}︡
︠84299b79-4d95-434e-9270-f55babb8d8c5i︠
%md
# Gaps
︡a8597999-1c2b-4bc5-a509-c412012e7c1c︡{"html":"<h1>Gaps</h1>\n"}︡
︠44691641-b816-4c2c-93c1-b3bdf76f4400︠
t = stats.TimeSeries(v)

︡104fe130-2929-468f-bb12-8c53c9c60c0f︡
︠e9001360-2819-4bfb-a09e-c69dd240c797︠
t.diffs().mean()
︡943cb017-ba6a-4fab-93ce-64fb18f31df9︡{"stdout":"0.7490744184827047\n"}︡
︠164dcce8-d0a5-44f9-a209-32aa2a04d518︠
s = t.diffs()
︡81926a6c-946d-4df6-875d-25353dbe27c0︡
︠5b943536-fe9b-45df-b3a2-db2cf9ed50a6︠
%time w = stats.TimeSeries([s[:i].mean() for i in [5,50,..,len(t)]])
︡30d7dda8-23d8-4694-abb3-10f866f52904︡{"stdout":"CPU time: 0.52 s, Wall time: 0.52 s"}︡{"stdout":"\n"}︡
︠b2e23c9e-7a1d-48d4-8136-2b8655d0f61c︠
w.plot()
︡d4d0c39e-c7f7-4444-8517-62ddf3e5fdfa︡{"once":false,"file":{"show":true,"uuid":"8d91fe01-55a6-469c-a8f7-ec33edf884c4","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/16345/tmp_XzlkzH.png"}}︡
︠967caf18-be90-488a-b288-87de44de60d2︠
show(t.diffs()[:2000].plot_histogram(bins=100, normalize=False), xmax=2.3, frame=True)
︡23fb0736-b9b6-416e-a709-4102026d4a8b︡{"once":false,"file":{"show":true,"uuid":"203f8e78-3af6-4d9e-9280-edc696a5dba2","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/16345/tmp_cTeoIQ.png"}}︡
︠7c25ef0d-f10c-4f0f-a01e-b3cc75c80df2︠
show(t.diffs()[:10000].plot_histogram(bins=100, normalize=False), xmax=2.3, frame=True)
︡8a4fd001-1b29-4fd4-a920-704c7cef9b8f︡{"once":false,"file":{"show":true,"uuid":"52563739-1c73-4639-8dde-3b657ff6c04d","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/16345/tmp_xGK48g.png"}}︡
︠2e19dc7a-cffa-458d-9639-fab0e6c15174︠
show(t.diffs().plot_histogram(bins=500, normalize=False), xmax=2.3, frame=True, gridlines=True, axes=False)
︡b03ca55d-e86d-42c6-9029-45209d0e2fa8︡{"once":false,"file":{"show":true,"uuid":"62644004-0719-46a8-a8e4-1d1b1b210219","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/16345/tmp_kgPgfX.png"}}︡
︠b09ac457-1a3a-42ef-a454-ecc7acefa9de︠

len(v)
︡66171e7e-1402-4003-93b2-009c1ad88933︡{"stdout":"100000\n"}︡
︠deddef51-df4d-4a93-acab-f6a58ea718d7︠
len(t.diffs())
︡944f57ae-d466-47d0-90b5-109354f7a1fc︡{"stdout":"99999\n"}︡
︠e2ef47b5-d9b7-4f14-82b4-aa79b1cc7496︠









