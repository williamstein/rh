︠2e899fe6-b2d9-4676-8a7e-e4c1e659749d︠
@interact
def f(n=4):
    a = (1+1/n)^n
    print N(a,1000)
    print N(e,1000)
︡62c648e1-2a06-425e-9cc3-cc45e0123b72︡{"interact":{"style":"None","flicker":false,"layout":[[["n",12,null]],[["",12,null]]],"id":"f62f227f-5a9f-4c4d-a71b-bb3d3b0023bd","controls":[{"control_type":"input-box","default":4,"label":"n","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"n","type":null}]}}︡
︠85d5f296-bfcf-46b3-89b1-9b607febc8ca︠
for X in [500000,1000000,..,3000000]:
    print X, prime_pi(X)
︡960b8b49-d1c8-4f63-933e-343c60cf87eb︡{"stdout":"500000 41538\n1000000 78498\n1500000 114155\n2000000 148933\n2500000 183072\n3000000 216816\n"}︡
︠258d3ddd-d11d-451e-aaad-6d8548deed3e︠
prime_range(10010)
︠81ef287d-617b-431f-954b-afa2e8ab3660︠
show(sum(point3d([p/log(p),log(p),p], size=5) for p in primes(100)), frame=False)
︠3bba7d3c-6107-4a4a-9602-e8c815eb89d4︠
%python
def err(X):
    n = 0
    for p in prime_range(X):
        n += 1
        if random() <= 0.01:
            if random() <=0.5:
                n -= 1
            else:
                n += 1

    return n - prime_pi(X)

︡daba352d-4a5e-4fab-86d7-633e6672124e︡
︠141a91e4-9843-4f66-92db-450028e4fc25︠
%time err(X)
︡9f69a7b2-3afa-4098-8af7-211a1e1017b5︡{"stdout":"-61"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.18 s, Wall time: 0.18 s\n"}︡
︠13d5f9b8-0f7d-49c1-9a39-a4ef8dc1f6f5︠
X = 3000000
%time v = stats.TimeSeries([abs(err(X)) for i in range(100)])
︡e88901d6-9bb1-4714-85cc-cf476774815b︡{"stdout":"CPU time: 18.68 s, Wall time: 18.68 s"}︡{"stdout":"\n"}︡
︠bb1f98fd-ebad-41c6-b9fd-a371e3902c2a︠

︠f17e69d0-5dd5-4402-b57e-629f60f14d1a︠
v.plot_histogram()
︡0396e873-d914-4f95-952e-6d48ddd1c8ef︡{"once":false,"file":{"show":true,"uuid":"6b301e8c-fffd-4d46-9482-44683b20cc04","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute15dc0/21303/tmp_duiV94.svg"}}︡
︠1c89ac39-b0a4-4cc6-bf99-912bf72be18c︠
v.mean(), N(sqrt(X))
︡e18e3eed-d907-41fb-ae38-994bc2f10313︡{"stdout":"(35.61, 1732.05080756888)\n"}︡
︠6a69be23-b194-4a24-87b2-5fa924c3d0f9︠






















