︠c7152877-46c3-4e69-ba23-fe43e66668b0︠
def prime_g(B):
    """
    Compute the numbers g(p) for all primes p <= B, as a time series.

    These are the numbers g(p)=(next_prime(p)-p)/p, which are numbers between 0 and 1.
    """
    v = [float(p) for p in prime_range(next_prime(B)+1)]  # primes less than B and one more.
    return stats.TimeSeries([(v[i+1]-v[i])/v[i] for i in range(len(v)-1)])
︡3b2dbb37-feac-43bd-bf44-6b393f0824da︡
︠488bb6af-f5f9-4f5b-8e16-6ff0a61889c3︠
%time t = prime_g(10^7); t
︡9d64ac76-f801-4798-ac8d-03a35bb9c350︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/mnt/home/4by9x1bp/.sagemathcloud/sage_server.py\", line 671, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 8, in prime_g\n  File \"c_lib.pyx\", line 70, in sage.ext.c_lib.sage_python_check_interrupt (sage/ext/c_lib.c:925)\nKeyboardInterrupt\n"}︡{"stdout":"CPU time: 7.02 s, Wall time: 6.91 s"}︡{"stdout":"\n"}︡
︠4fb631f9-701e-4a9a-a73e-6b9ff16ac875︠
%time show(t.plot_histogram(bins=5000), xmax=.01,ymax=150)
︡844c3977-bfa0-4c56-97f8-b408cbc59f86︡{"once":false,"file":{"show":true,"uuid":"96b7705a-d006-41f6-9137-0cc95c6ea929","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_GgUjcv.png"}}︡{"stdout":"CPU time: 10.65 s, Wall time: 8.76 s"}︡{"stdout":"\n"}︡
︠64849d89-6feb-4c9b-b3a2-42950bb542b4︠
t2 = stats.TimeSeries([x for x in t if x<=.002])
︡23ff579a-0575-4f2e-8396-962fbe99544a︡
︠88874058-abfc-481d-80a0-d227f0533c9f︠
len(t)
len(t2)
︡94a0f410-59e7-47d1-b5b8-33fd689a9afa︡{"stdout":"664579\n"}︡{"stdout":"663995\n"}︡
︠52f74e96-1420-4d36-83a7-5c23416ca64c︠
%time show(t2.plot_histogram(bins=1000), ymax=10000)
︡46065a6b-97b1-44a2-bd3d-4e340171b981︡{"once":false,"file":{"show":true,"uuid":"61ab2236-3a1c-4c45-9ecd-390018a62d61","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_BhK9Gr.png"}}︡{"stdout":"CPU time: 1.92 s, Wall time: 1.78 s"}︡{"stdout":"\n"}︡
︠2de4eaa5-8424-4e92-b994-2423ec35957e︠
t3 = stats.TimeSeries([x for x in t2 if x<=.001])
len(t)
len(t2)
len(t3)
%time show(t3.plot_histogram(bins=1000), ymax=10000)
︡c1070b32-939f-41b4-a906-4bcd4e4f845a︡{"stdout":"664579\n"}︡{"stdout":"663995\n"}︡{"stdout":"663432\n"}︡{"once":false,"file":{"show":true,"uuid":"8e91a448-cfef-44d5-95e0-36d12cb2b715","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_39O78s.png"}}︡{"stdout":"CPU time: 1.94 s, Wall time: 1.81 s"}︡{"stdout":"\n"}︡
︠b7863f85-5870-4f5b-800c-c3b4669c2e75︠
%time t = prime_g(10^8); t
︡3aaa9419-7168-476c-8c88-75b3ccc911ce︡{"stdout":"[0.5000, 0.6667, 0.4000, 0.5714, 0.1818 ... 0.0000, 0.0000, 0.0000, 0.0000, 0.0000]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 7.95 s, Wall time: 7.94 s\n"}︡
︠24d112f2-f04c-4581-af8c-4e1e7e9549f4︠
%time show(t.plot_histogram(bins=3000), xmax=.01,ymax=150)
︡ce130545-a6d3-4932-ac11-0525aeb2f4ac︡{"once":false,"file":{"show":true,"uuid":"e500cc40-fc51-47d6-a54a-797114ca259c","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_TqHvFR.png"}}︡{"stdout":"CPU time: 5.07 s, Wall time: 4.98 s"}︡{"stdout":"\n"}︡
︠feafc46a-1171-41e0-afd6-4934d65c4b53︠
t2 = stats.TimeSeries([x for x in t if x<=.001])
len(t)
len(t2)
%time show(t2.plot_histogram(bins=1000), ymax=10000)
︡070a69b0-6209-4d31-84b9-bbd1db45ca76︡{"stdout":"5761455\n"}︡{"stdout":"5760308\n"}︡{"once":false,"file":{"show":true,"uuid":"242495d0-9297-4eb9-8016-a2fb08edd2ff","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_AkEFiR.png"}}︡{"stdout":"CPU time: 2.24 s, Wall time: 2.12 s"}︡{"stdout":"\n"}︡
︠7304173b-135e-4b5c-9afc-680e39c7697f︠
%time show(t2.plot_histogram(bins=1000), ymax=20000, xmax=2e-4)
︡345cd707-a1ec-4df9-8e67-2ac2b5711566︡{"once":false,"file":{"show":true,"uuid":"ae4d2e4c-6307-4048-9bf2-7feae484d665","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_5nZbcw.png"}}︡{"stdout":"CPU time: 1.95 s, Wall time: 1.89 s"}︡{"stdout":"\n"}︡
︠d18886e7-7cb0-4316-be17-a86773b4afe2︠
%time t = prime_g(10^9); t
︡23be75f9-0985-48dd-b214-22d1280e246f︡{"stdout":"[0.5000, 0.6667, 0.4000, 0.5714, 0.1818 ... 0.0000, 0.0000, 0.0000, 0.0000, 0.0000]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 75.75 s, Wall time: 75.64 s\n"}︡
︠ca510bf8-2677-4cb6-bb55-5c41faa1ae67︠
%time show(t.plot_histogram(bins=3000), xmax=.01,ymax=150)
︡006e0016-9140-4cec-9128-d1e30fac56b2︡{"once":false,"file":{"show":true,"uuid":"e4c2a620-96b3-49d2-966e-2e4bc3eaea04","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_10RE3T.png"}}︡{"stdout":"CPU time: 7.95 s, Wall time: 7.86 s"}︡{"stdout":"\n"}︡
︠07b57dff-b736-4623-9cb4-18020192cada︠
eps = float(0.001)
t2 = stats.TimeSeries([x for x in t if x<=eps])
len(t)
len(t2)
%time show(t2.plot_histogram(bins=1000), ymax=10000)
︡d622385c-2a8e-4264-aa10-9294ef25ba70︡{"stdout":"50847534\n"}︡{"stdout":"50846387\n"}︡{"once":false,"file":{"show":true,"uuid":"209cf490-286f-4f2b-806d-4125f4a2e8f3","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_lnHzHC.png"}}︡{"stdout":"CPU time: 3.57 s, Wall time: 3.46 s"}︡{"stdout":"\n"}︡
︠9fec0ff4-f4d1-4930-89b0-12cb6141e174︠
%time show(t2.plot_histogram(bins=1000), ymax=20000, xmax=5e-5)
︡f1ad9640-8d0f-4ea9-ac79-61eedb2a04ab︡{"once":false,"file":{"show":true,"uuid":"f0688857-025f-47a8-a046-fa73bb356640","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_KclN_x.png"}}︡{"stdout":"CPU time: 2.80 s, Wall time: 2.63 s"}︡{"stdout":"\n"}︡
︠494ebefb-b83d-4bcd-81e9-d800d6976854︠
%time show(t2.plot_histogram(bins=5000), ymax=20000, xmax=1e-5)
︡0f85e0ce-3986-4fd4-a802-452a592c6600︡{"once":false,"file":{"show":true,"uuid":"f85e99b3-6193-4336-8453-7398994cc0b4","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/26097/tmp_suYTAD.png"}}︡{"stdout":"CPU time: 9.60 s, Wall time: 9.50 s"}︡{"stdout":"\n"}︡
︠c94bb8f4-5c79-4367-bd1a-a8c093929a2d︠









