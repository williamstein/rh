︠c7152877-46c3-4e69-ba23-fe43e66668b0︠
def prime_g(B):
    """
    Compute the numbers g(p) for all primes p <= B, as a time series.

    These are the numbers g(p)=(next_prime(p)-p)/p, which are numbers between 0 and 1.
    """
    from math import log, sqrt
    v = [float(p) for p in prime_range(next_prime(B)+1)]  # primes less than B and one more.
    return stats.TimeSeries([(v[i+1]-v[i])/sqrt(log(v[i])) for i in range(len(v)-1)])
︡0550e4a9-fdc7-4aca-a936-5b4bcc67b52b︡
︠488bb6af-f5f9-4f5b-8e16-6ff0a61889c3︠
%time t = prime_g(10^7); t
︡edd2fbbd-64d7-406a-b8bc-c734c5bccd57︡{"stdout":"[1.2011, 1.9081, 1.5765, 2.8675, 1.2916 ... 1.4945, 6.9743, 0.4982, 4.4835, 6.9743]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 1.07 s, Wall time: 1.08 s\n"}︡
︠4fb631f9-701e-4a9a-a73e-6b9ff16ac875︠
%time show(t.plot_histogram(bins=1000))
︡1563d450-3548-43e7-92f3-62c2371a1c52︡{"once":false,"file":{"show":true,"uuid":"081b0766-dd5e-445e-8a19-18b005bcbb00","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/10388/tmp_ZNe8MQ.png"}}︡{"stdout":"CPU time: 1.83 s, Wall time: 1.74 s"}︡{"stdout":"\n"}︡
︠64849d89-6feb-4c9b-b3a2-42950bb542b4︠
show(t.plot_histogram(bins=1000),xmax=13)
︡12d989e2-e372-4a36-bb7b-5e94f121d607︡{"once":false,"file":{"show":true,"uuid":"7bf97bc0-527c-4ed1-bd7f-91c0f481cd3f","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/10388/tmp_WPCXBp.png"}}︡
︠6bc0bd16-8811-430d-8ac3-1abb24b23e80︠
%time t = prime_g(10^8); t
︡31c1f010-a31b-467c-9c85-f56004e4b2ce︡{"stdout":"[1.2011, 1.9081, 1.5765, 2.8675, 1.2916 ... 2.3300, 4.1939, 2.7959, 4.1939, 4.1939]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 9.14 s, Wall time: 9.14 s\n"}︡
︠09fb0f82-a23d-4b89-bd87-fdd56044ccdc︠
%time show(t.plot_histogram(bins=1000))
︡6ad9ab98-0878-4429-9627-a0f7dd24691a︡{"once":false,"file":{"show":true,"uuid":"72c61a89-12dd-457c-839e-82d4eca60007","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/10388/tmp_sO702V.png"}}︡{"stdout":"CPU time: 1.73 s, Wall time: 1.64 s"}︡{"stdout":"\n"}︡
︠49e8a6d0-5018-4778-af39-0ce88231d070︠
show(t.plot_histogram(bins=1000),xmax=13)
︡7e66aafe-4819-4d4d-84b8-9aa00b9a6ffa︡{"once":false,"file":{"show":true,"uuid":"84177481-253b-4dde-b345-eeecdecdec89","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/10388/tmp_2XXQpE.png"}}︡
︠3fdeee27-e32b-4e51-b338-824cb583891f︠
show(t.plot_histogram(bins=3000),xmax=13)
︡4cfbdaae-0b20-4de0-a9bb-624d2747b122︡{"once":false,"file":{"show":true,"uuid":"eed20daf-cd0c-40ce-bd5e-27e4fed76281","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/10388/tmp_PP9u97.png"}}︡
︠cb781ccb-0e6c-4d97-8bca-45fceba38431︠
%time t = prime_g(10^9); t
︡2dfb1bb0-fe7a-40d8-8628-cdc78ac1f78c︡{"stdout":"[1.2011, 1.9081, 1.5765, 2.8675, 1.2916 ... 18.8916, 2.1967, 7.9081, 1.7574, 15.3769]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 83.72 s, Wall time: 83.72 s\n"}︡
︠285b2b6e-6a94-46e0-bcc0-f61ced593560︠
%time show(t.plot_histogram(bins=2000))
︡6f59b7a3-7b5d-4d39-9c46-539402ad34ae︡{"once":false,"file":{"show":true,"uuid":"60e135a4-3616-4f91-82f7-06bb41f67ebb","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/10388/tmp_qnYm2c.png"}}︡{"stdout":"CPU time: 6.02 s, Wall time: 5.92 s"}︡{"stdout":"\n"}︡
︠87449257-e6fc-4972-9d9c-318efd1d0bc5︠

show(t.plot_histogram(bins=4000),xmax=13)
︡585ddf75-576f-4727-9c7e-85ae743baca6︡{"once":false,"file":{"show":true,"uuid":"8f0414d5-3c6d-4727-a688-d9aa51110eec","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/10388/tmp_pHzKsV.png"}}︡
︠d51c8b10-6a99-41ec-8565-f508503051f8︠
︡1e9b35fb-0188-44f7-9392-07bd0f1323f9︡
︠c7de407c-f5d6-4541-9939-399a88420e3e︠
︡6f858808-671d-4dc2-95f1-e0353c2438df︡
︠f96671d6-9834-4cde-bee0-182fa39e7b75︠









