︠f84d46d3-4670-4679-bb5d-50293437c593︠
v = zeta_zeros()
︡bcc9cbbd-551f-4176-91bc-252a6ca55a5c︡
︠781cbd57-31d5-4cbd-ab25-7580f057e2b7︠
len(v)
︡c336ddad-e29f-4a92-9288-37140a52e879︡{"stdout":"100000\n"}︡
︠5117eba8-2504-4aa2-8398-03d139c53f09︠
def rmod(a,b):
    return a -  a//b *b

︡9a871624-6828-4a0c-84ab-8cf5dfe609d7︡
︠1f14e592-92ce-4b28-9c0e-b119dffb843c︠
rmod(7,float(pi))
︡6de6ffa6-efff-4bb0-99ba-060ccf3e4bf0︡{"stdout":"0.7168146928204138\n"}︡
︠c6e179a8-b26c-4926-aa93-a7a19bb647ca︠
def f(per):
    per = float(per)
    w = [rmod(a,per) for a in v]
    show(stats.TimeSeries(w).plot_histogram())
︡19a0890c-69d5-4454-9e36-c327813c79b4︡
︠69d845e2-1345-4d70-9896-e6d49bfab656︠
f(2*pi)
︡d44c5183-5634-48d1-9a2d-ba45973e94c0︡{"once":false,"file":{"show":true,"uuid":"fca953c1-7f6e-46e2-935e-8fdf256b0356","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/27662/tmp_9z1tFT.png"}}︡
︠760f1055-ab37-4f86-a648-d3e12abee107︠
f(1)
︡2ba86c03-87ee-4e0b-a8ce-a82b7f3bcae0︡{"once":false,"file":{"show":true,"uuid":"2d4bb049-a05a-4bc2-a9ee-82d62a976d3f","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/27662/tmp_geErKl.png"}}︡
︠08e66e1b-053a-4a99-8e72-dc7f2071a3e0︠
def circ():
    per = float(2*pi)
    w = [rmod(a,per) for a in v]
    g = points([(cos(a),sin(a)) for a in w])
    show(g, aspect_ratio=1)
︡f2cbfc9a-942f-4043-9a50-f5c706243c87︡
︠ac105231-b6e7-46ed-9c14-18ed96079600︠
circ()
︡e8980899-74af-4d00-93b6-00af975365b8︡{"once":false,"file":{"show":true,"uuid":"5e7580b8-66b9-4ec5-ad42-0b1c2610bda4","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/27662/tmp_R6aB8o.png"}}︡
︠6367b39c-dabb-4b4e-b77b-598733d0e798︠









