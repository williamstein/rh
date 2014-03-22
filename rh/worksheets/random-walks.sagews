︠788829ba-2ae5-4958-8610-480202faa1b0︠
import random
def rw():
    return stats.TimeSeries([random.choice([-1r,1r]) for _ in range(1000)]).sums()
︠24c5241e-7397-4d92-8b2b-29777cf23b2f︠
def f(B, seed=1):
    set_random_seed(seed)
    v = [rw() for i in range(B)]
    g = sum([z.plot(thickness=.3) for z in v])
    show(g)
    s = sum([z.abs().vector()/B for z in v])
    avg = stats.TimeSeries(list(s))
    show(avg.plot() + plot(sqrt(2/pi)*sqrt(x), (0,g.xmax()), color='red', thickness=2))
︡82d9f7a4-3031-47fc-891a-2676eb91d615︡
︠1376945b-b1d3-46de-a4f4-9a266d61c4c9︠
f(3, 1)
︡70c77c49-e9e0-4cc1-b135-a0cc0aa4ba00︡{"once":false,"file":{"show":true,"uuid":"8d4941b6-fe13-4360-bfea-96854e9dab62","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/4996/tmp_QfdQ2j.png"}}︡{"once":false,"file":{"show":true,"uuid":"619db0d2-34e9-438d-b372-846d069981a1","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/4996/tmp_25LjRt.png"}}︡
︠e3594bab-52b1-4365-af5a-529b479f9954︠
f(10, 1)
︡b0481b3b-bad7-4834-8f4c-df3e4038549a︡{"once":false,"file":{"show":true,"uuid":"f3be4587-9b12-40a3-a92a-424bd2d13628","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/4996/tmp_VHHQTC.png"}}︡{"once":false,"file":{"show":true,"uuid":"062b40ec-495d-46df-babf-6b7c0e9fadc3","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/4996/tmp_nDiCxw.png"}}︡
︠9d4fb226-d3a7-4ec8-9470-fa85728929c5︠
f(50, 1)
︡455c318f-9952-4b1b-b98f-1a518ccdde71︡{"once":false,"file":{"show":true,"uuid":"0691e8e4-7924-457b-afde-f357ce17c44b","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/4996/tmp_ySFlir.png"}}︡{"once":false,"file":{"show":true,"uuid":"cddd92c4-e62f-4c61-ac95-4a4b910a252c","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/4996/tmp_zQDNHQ.png"}}︡
︠5e540bba-13e3-463b-b4ad-f96293953e81︠
f(5000, 1)
︡4a0b24af-5477-44e5-b19b-25f9668fdb96︡{"once":false,"file":{"show":true,"uuid":"6b81aadf-bc7e-49c2-b34d-80406d24e7e0","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/4996/tmp_8t1ldD.png"}}︡{"once":false,"file":{"show":true,"uuid":"a87b238c-a222-42a4-b895-fad615418e01","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/4996/tmp_v_N5OI.png"}}︡
︠f3f18a27-d4f7-45cd-870d-03ad6fefd51f︠









