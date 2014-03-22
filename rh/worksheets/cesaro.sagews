︠957d1c79-5580-4627-bba8-012c492cfbb6︠
theta = var('theta')
def f(C):
    T = SR(0)
    for q in prime_powers(C+1):
        if q > 1:
            p, n = factor(q)[0]
            T += 2 * p^(-n/2) * log(p) * cos(n*log(p)*theta)
    return T
︡a9a446d7-11eb-45bd-8bfc-19d1679e67db︡
︠2327fb3c-80ad-4c82-8a22-5ca68341de75︠
h = f(5)
︡5dce65f0-d98b-4372-8607-8ccfe1264fec︡
︠c6f7796c-eeb5-4aa5-98c9-b960ee4ba4e1︠
plot(h^2, 5, 40)
︡4480e126-2acc-407b-acf0-ac6eb68f6a29︡{"once":false,"file":{"show":true,"uuid":"eed38346-75e7-482b-a26a-5fb379a8fd68","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/1946/tmp_ao5Pi1.png"}}︡
︠e27644b2-42bb-4313-b88e-7d4a757fd728︠
k = h^2
︡3a926b12-7f61-40cf-a515-0065f769cca9︡
︠5b811652-9809-45c5-81cd-4d8d407dbdf5︠
T = var('T')
assume(T>0)
g(T) = 1/T * k.integrate(theta, 0, T)
︡4d641221-30d7-4ab1-a39b-8a5701b3d57f︡
︠aee51457-f96f-43fb-b100-0f2dc7e48910︠
plot(g, 0, 40, color='red') + plot(k,0,40)
︡f5a7bd2b-fce4-4a6a-8dc4-7e090afaed91︡{"once":false,"file":{"show":true,"uuid":"814f17b1-7b12-4af5-a86f-3bb2c1547c2a","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/1946/tmp_Vwm_tE.png"}}︡
︠da0fd289-8863-41b7-859f-bb7ebe040c53︠









