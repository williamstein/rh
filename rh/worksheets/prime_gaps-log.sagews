︠c7152877-46c3-4e69-ba23-fe43e66668b0︠
def prime_g(B):
    """
    Compute the numbers g(p) for all primes p <= B, as a time series.

    These are the numbers g(p)=(next_prime(p)-p)/p, which are numbers between 0 and 1.
    """
    from math import log
    v = [float(p) for p in prime_range(next_prime(B)+1)]  # primes less than B and one more.
    return stats.TimeSeries([(v[i+1]-v[i])/log(v[i]) for i in range(len(v)-1)])
︡fc777b8e-da2d-4238-b4d3-0877256be7e2︡
︠488bb6af-f5f9-4f5b-8e16-6ff0a61889c3︠
%time t = prime_g(10^7); t
︡3c473989-8315-4142-a284-855556026c6f︡{"stdout":"[1.4427, 1.8205, 1.2427, 2.0556, 0.8341 ... 0.3723, 1.7372, 0.1241, 1.1168, 1.7372]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 1.13 s, Wall time: 1.13 s\n"}︡
︠4fb631f9-701e-4a9a-a73e-6b9ff16ac875︠
%time show(t.plot_histogram(bins=1000))
︡42753780-1819-47ea-8e33-6999c1e069d5︡{"once":false,"file":{"show":true,"uuid":"457be07f-a3da-4a24-bfec-96c2de5259ad","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/29246/tmp_Trqklg.png"}}︡{"stdout":"CPU time: 2.16 s, Wall time: 2.10 s"}︡{"stdout":"\n"}︡
︠64849d89-6feb-4c9b-b3a2-42950bb542b4︠
show(t.plot_histogram(bins=1000),xmax=4)
︡eae2af6e-d0ea-4ff3-9591-4af9a88d8f83︡{"once":false,"file":{"show":true,"uuid":"9c511907-896f-4c50-b162-b100ba1f154e","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/29246/tmp_I_Lpbq.png"}}︡
︠6bc0bd16-8811-430d-8ac3-1abb24b23e80︠
%time t = prime_g(10^8); t
︡cbedc096-5916-4400-b8fe-d554bfe1fb1a︡{"stdout":"[1.4427, 1.8205, 1.2427, 2.0556, 0.8341 ... 0.5429, 0.9772, 0.6514, 0.9772, 0.9772]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 9.19 s, Wall time: 9.19 s\n"}︡
︠09fb0f82-a23d-4b89-bd87-fdd56044ccdc︠
%time show(t.plot_histogram(bins=1000))
︡1611f300-f6e2-473f-80db-d6889f6aaa39︡{"once":false,"file":{"show":true,"uuid":"75897245-bc63-4660-9d8e-9848059f8e64","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/29246/tmp_yRL6EM.png"}}︡{"stdout":"CPU time: 2.10 s, Wall time: 2.05 s"}︡{"stdout":"\n"}︡
︠49e8a6d0-5018-4778-af39-0ce88231d070︠
show(t.plot_histogram(bins=1000),xmax=4)
︡eadea4f4-26fa-43b6-9a24-a8b7a600a54c︡{"once":false,"file":{"show":true,"uuid":"8e4a98ac-1664-4359-b99e-808dbc51042b","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/29246/tmp_KqTeC5.png"}}︡
︠3fdeee27-e32b-4e51-b338-824cb583891f︠
show(t.plot_histogram(bins=3000),xmax=4)
︡c984e43f-75c4-456b-8568-dd740be0b5ab︡{"once":false,"file":{"show":true,"uuid":"e11e1d8a-775f-4399-abb5-7676d718ca14","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/29246/tmp_9sp6L2.png"}}︡
︠cb781ccb-0e6c-4d97-8bca-45fceba38431︠
%time t = prime_g(10^9); t
︡a354b6f0-79d5-47fd-9743-1643f7c952fb︡{"stdout":"[1.4427, 1.8205, 1.2427, 2.0556, 0.8341 ... 4.1499, 0.4825, 1.7372, 0.3860, 3.3778]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 91.92 s, Wall time: 91.87 s\n"}︡
︠285b2b6e-6a94-46e0-bcc0-f61ced593560︠
%time show(t.plot_histogram(bins=2000))
︡50ba8ba4-498a-4c22-b34f-6aed953b7af9︡{"once":false,"file":{"show":true,"uuid":"93a0024a-62b5-4a68-9bc9-0ae7dbb80eb6","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/29246/tmp_PA9aVa.png"}}︡{"stdout":"CPU time: 6.19 s, Wall time: 6.10 s"}︡{"stdout":"\n"}︡
︠87449257-e6fc-4972-9d9c-318efd1d0bc5︠

show(t.plot_histogram(bins=4000),xmax=4)
︡46354f8d-d6f8-4ba0-b5b1-86f01ce15531︡{"once":false,"file":{"show":true,"uuid":"b0a36985-a8cc-404a-90ec-22f815bcda17","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/29246/tmp_b3Y4P5.png"}}︡
︠d51c8b10-6a99-41ec-8565-f508503051f8︠









