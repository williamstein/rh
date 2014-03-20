︠61220be2-ef67-462f-8cf8-2cf3b792ed11︠
1.6*.00025
︡3ecf123c-3f49-4f3c-ade5-c99c7b58baef︡{"stdout":"0.000400000000000000\n"}︡
︠0b868060-a1a0-4012-b2c7-98b209713f08︠
polygon2d.options
︡7473a842-7497-4a0d-86a6-29bf83c5c8b9︡{"stdout":"'automatic'\n"}︡
︠0b40f245-6fd0-441d-8e0c-9fe4cf069032︠
%load code.sage
︡b8abd6e7-080b-4512-9362-6239db897b28︡
︠8bdd3bcb-d391-4a9f-a7d8-f0cef539369a︠
%time
draw("random_walks")

︡5e0b0c37-a028-4fac-904f-150b616d759a︡{"stdout":"Drawing random_walks... "}︡{"stdout":" "}︡{"stdout":" (time = 67.0932559967 seconds)\n"}︡{"stdout":"CPU time: 67.09 s, Wall time: 66.59 s\n"}︡
︠56582f35-345d-47f2-a4d8-281e050eab6e︠









︠59430b3a-b0f2-46ba-93b8-8f51522a2f7b︠
p = area_under_inverse_log(30)
︡065f0a24-4733-450b-95f3-b8eefc2ff43b︡
︠8e1912f4-1e64-4891-ab8a-b5bd68b72f7b︠
show(p, aspect_ratio='automatic', svg=True)
︡fb88bfb2-5632-453e-a7c8-0661cdfea19f︡{"file":{"show":true,"uuid":"e7a64600-bcfe-4eb2-909e-fd6882a87f57","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/3980/tmp_3UTM5b.svg"}}︡
︠54f130dc-7701-45c2-9fc1-7524b031c246︠
p.aspect_ratio()
︡db7d8a30-69b5-484f-9f9c-b782169a40ee︡{"stdout":"1.0\n"}︡
︠b5b25d78-6da4-4501-9845-7ac6347b12fb︠
a = p[0] + p[1] + sum(p[3:]); b = p[2]
︡23eaf40a-6f26-436f-8458-6dfb3054d3a0︡
︠3ac48aac-f885-44d5-a632-33b61bec0027︠
a
︡02b04ba9-4124-4cd0-8e51-7f7bf9055901︡{"file":{"show":true,"uuid":"f90ed931-cc3a-4c4a-8ff1-cc9db0547b55","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/3980/tmp_ZAR558.png"}}︡
︠382f0d54-c2d2-4cf9-a670-9aa811e86b97︠
b.set_aspect_ratio('automatic')
︡40122f29-95f8-4fb1-84a9-6883428b7480︡
︠5e47d3fe-ec95-474f-9cdf-59e2c8159ddf︠
b.aspect_ratio()
︡3b527867-f8d4-4a57-8861-b1271e8b65cb︡{"stdout":"'automatic'\n"}︡
︠0509f817-e85f-4cc4-8434-c51ea248474b︠
a+b
︡84719e77-b367-4503-883b-a8951d10b947︡{"file":{"show":true,"uuid":"662d7f32-6dfb-478f-8f8f-c5bd16b4f6d4","filename":"/mnt/home/4by9x1bp/.sage/temp/compute4a/3980/tmp_UzkVvD.png"}}︡
︠6fc7d23b-c3c0-48f4-af28-75d01374f403︠

polygon2d.options
︡c281bdee-d353-4331-b64b-4958edf43c8a︡{"stdout":"{'aspect_ratio': 1.0, 'alpha': 1, 'fill': True, 'legend_label': None, 'rgbcolor': (0, 0, 1), 'thickness': None}\n"}︡
︠09bf4c91-d13e-474c-a6be-5ce0bfa15732︠

circle.options
︡d6cd2f8b-be3a-4887-a26e-8c57dbcb2dff︡{"stdout":"{'edgecolor': 'blue', 'facecolor': 'blue', 'clip': True, 'legend_label': None, 'thickness': 1, 'zorder': 5, 'aspect_ratio': 1.0, 'alpha': 1, 'linestyle': 'solid', 'fill': False}\n"}︡
︠0e5c9217-9a87-4ab4-9275-643e2f25192b︠









