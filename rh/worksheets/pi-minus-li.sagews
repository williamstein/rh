︠dfcfc004-ab21-4f82-b6d7-c3d9d856578d︠
plot(lambda x : prime_pi(x) - Li(x), (2, 100), plot_points=1000)
︡7ae38e95-8b56-4b71-ada4-857f7a0055d5︡{"once":false,"file":{"show":true,"uuid":"8b072be6-e1a6-49a3-9037-f0045bd560cc","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_CO_v38.png"}}︡
︠d173132b-6396-4735-b490-79390ddb9884︠
plot(lambda x : prime_pi(x) - Li(x), (2, 1000), plot_points=1000)
︡d8f88436-638c-432e-93e8-a9a66f5b5672︡{"once":false,"file":{"show":true,"uuid":"a8063f80-b390-475a-8960-8f686e29dadd","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_kB6YWc.png"}}︡
︠39709c98-80d5-44e2-b4ec-19247b1c91f9︠
plot(lambda x : prime_pi(x) - Li(x), (2, 10000), plot_points=1000)
︡c86ac541-8354-426b-b004-256e6032d86b︡{"once":false,"file":{"show":true,"uuid":"3cd0a110-0e01-4ada-ab00-10c99969359e","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_uSTq4F.png"}}︡
︠170cb8e6-cc00-45a8-8b87-569f07fa2f15︠

︠8e4219a9-d2d3-44aa-b571-968704cc195d︠
B = 20000
v = stats.TimeSeries([Li(n) - prime_pi(n) for n in [2..B]])
v2 = stats.TimeSeries([0]+[v[:i].mean() for i in range(1,len(v))])
v.plot(plot_points=B) + v2.plot(color='red', plot_points=B) + plot(sqrt(x)*(13/sqrt(10000)), (2, B), color='purple')
︡9838b97b-82db-47a4-940b-e2bb55fb8854︡{"once":false,"file":{"show":true,"uuid":"4b834d17-5870-48a8-b018-faa9b840e60b","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_r8F7iK.png"}}︡
︠87eb364a-156f-4626-8e72-b792a1ee103d︠
%time
B = 40000
v = stats.TimeSeries([Li(n) - prime_pi(n) for n in [2..B]]).abs()
v2 = stats.TimeSeries([0]+[v[:i].mean() for i in range(1,len(v))])
v.plot(plot_points=B) + v2.plot(color='red', plot_points=B) + plot(sqrt(2/pi)*sqrt(x)/log(x), (2, B), color='purple')
︡37a52e94-815e-48f7-9af2-8bc1e1e7a8ce︡{"once":false,"file":{"show":true,"uuid":"0c5d5321-200d-4ee8-97c3-1d6b5f0d75b7","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_mbwyf0.png"}}︡{"stdout":"CPU time: 19.64 s, Wall time: 17.60 s"}︡{"stdout":"\n"}︡
︠2716690b-ad94-4762-894c-ab115737b851︠
%time
B = 100000
v = stats.TimeSeries([Li(n) - prime_pi(n) for n in [2..B]]).abs()
v2 = stats.TimeSeries([0]+[v[:i].mean() for i in range(1,len(v))])
︠b42efae5-1954-4787-a2be-5880253c8ff1︠

v.plot(plot_points=B) + v2.plot(color='red', plot_points=B) + plot(sqrt(x)/log(x), (2, B), color='purple')

︡072b05d4-9415-46e6-aa39-f1940c07a2c4︡{"once":false,"file":{"show":true,"uuid":"8cb2aaf3-49c7-4b7c-9414-385938fe94bc","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_wb6H4R.png"}}︡
︠8d49b867-6506-4c21-8138-7f960f80cb3d︠

%time
B = 100000
v = stats.TimeSeries([Li(n) - prime_pi(n) for n in [2..B]]).abs()
v2 = stats.TimeSeries([0]+[v[:i].mean() for i in range(1,len(v))])
︠7e8bd2f4-a308-4f0f-b2ec-b782653fa0f8︠
x=var('x')
v.plot(plot_points=B) + v2.plot(color='red', plot_points=B) + plot(sqrt(2/pi)*sqrt(x/log(x)), (2, B), color='purple')

︡78dca96c-7c37-48ae-96bf-542986ad7e1c︡{"once":false,"file":{"show":true,"uuid":"41ea28c0-f6fe-4f75-a0ed-428f37b214c0","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_UCDKo7.png"}}︡
︠612aef38-cb98-4127-a46b-0bd2d81cf48f︠
%time v = stats.TimeSeries([Li(n) - prime_pi(n) for n in [2..B]]).abs()

︡4e281907-756e-4c64-b8f3-b88cfcaf5008︡{"stdout":"CPU time: 36.28 s, Wall time: 36.13 s"}︡{"stdout":"\n"}︡
︠3537f19c-1cec-439d-9871-9fbf884c06b6︠
def prime_pi_time_series(B):
    """
    Return the time series stats.TimeSeries([prime_pi(n) for n in [0..B-1]])
    but computed (vastly) more efficiently.
    """
    x = 0
    w = []
    pp = 0
    for p in prime_range(B):
        w.extend([x]*(p-pp))
        pp = p
        x += 1
    w.extend([x]*(B-pp))
    return stats.TimeSeries(w)

def running_average(v):
    """
    Return the running average of the time series... i.e., the Cesaro sum.
    i.e., stats.TimeSeries([0]+[v[:i].mean() for i in range(1,len(v))]),
    but computed (vastly) more efficiently.
    """
    s = v.sums()
    # now divide s[i] by i+1 for i>=1.
    for i in range(1,len(s)):
        s[i] /= i+1
    return s

︡0d2abaec-93fd-4eee-b697-504b7df85a0b︡
︠24d03db5-0f2c-42a6-92d2-b0586f58a06c︠
running_average(stats.TimeSeries([1,2,3,4]))
︡3a940d6e-21f0-4e96-8000-91036949da06︡{"stdout":"[1.0000, 1.5000, 2.0000, 2.5000]\n"}︡
︠96edbe62-c21a-477f-b9e1-1d37856d239d︠
import math
︡da58d775-7931-4429-bde4-df7d01537fa2︡

︠eb91fc77-d658-4af9-97df-35f27aee8ca7︠
import scipy.special

︡54a4c46b-8197-4bae-a8f3-55b6bafff4a4︡
︠f181bb23-de93-4a29-8a79-0afa6168e024︠
import mpmath
︡1a5f0922-8a27-4617-b8d8-1306f20070df︡
︠b24ed48d-bfa2-4f2a-af6c-5276e2d1f2d8︠
a = float(5)
︡fdefdeb5-782e-47d6-942d-4335396b8932︡
︠d3c76fa9-08f6-4ba6-b157-18890e6d154f︠
%timeit float(mpmath.li(a,offset=True))
︡7c7b8028-1ba9-41b1-a3de-9de1f254d911︡{"stdout":"625 loops, best of 3: 75.5 µs per loop"}︡{"stdout":"\n"}︡
︠ea8ed23f-726c-40a1-9b3c-b6b1c2b003a9︠
%timeit Li(a)
︡e4c06773-88ba-4645-bcc2-c3ce2b53c268︡{"stdout":"625 loops, best of 3: 145 µs per loop"}︡{"stdout":"\n"}︡
︠210dc8be-ff1b-43ea-ac20-32b8078f99dd︠

%time zz = [Li(float(n)) for n in range(B)]
︠fdd339fc-10c3-4d2e-9dc9-d06c7cbef114︠

%time zz = [Li(float(n)) for n in range(B)]
︡5f60725d-52ff-4d9d-ab57-8fa2f8ef2b51︡{"stdout":"CPU time: 1.71 s, Wall time: 1.72 s"}︡{"stdout":"\n"}︡
︠c70a48bf-2e69-4be6-b4c0-f349ffea2ba3︠
B = 100000
%time v = prime_pi_time_series(B)
%time li_minus_pi = stats.TimeSeries([0,0] + [mpmath.li(i,offset=True)-v[i] for i in range(2,B)])
%time v2 =running_average(li_minus_pi)
︡beebe6c4-d8c1-4e7e-8552-47868ef25678︡{"stdout":"CPU time: 0.04 s, Wall time: 0.04 s\n"}︡{"stdout":"CPU time: 10.63 s, Wall time: 10.62 s"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.70 s, Wall time: 0.70 s"}︡{"stdout":"\n"}︡
︠e4aa9c09-2769-4ac3-baf2-e0d3b73e668f︠

︠911d1322-5fa1-456f-9450-a9dd75692ae0︠
li_minus_pi.plot(plot_points=B) + v2.plot(color='red', plot_points=B) + plot(sqrt(2/pi)*sqrt(x/log(x)), (2, B), color='purple')
︡6a9837a4-760c-47d2-bc4e-4ebf38933e6f︡{"once":false,"file":{"show":true,"uuid":"5d6fb4a8-b07e-44d2-a902-b682b5ec2702","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_Ho1sxq.png"}}︡
︠fb01bf56-2ea4-4d88-a60b-cc701720593b︠

B = 250000
%time v = prime_pi_time_series(B)
%time li_minus_pi = stats.TimeSeries([0,0] + [mpmath.li(i,offset=True)-v[i] for i in range(2,B)])
%time v2 =running_average(li_minus_pi)


︡74222ea7-4dfa-4026-a665-c5ae129c4c41︡{"stdout":"CPU time: 0.09 s, Wall time: 0.09 s\n"}︡{"stdout":"CPU time: 27.17 s, Wall time: 27.16 s"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 1.78 s, Wall time: 1.78 s"}︡{"stdout":"\n"}︡
︠0a3be619-a0d7-46dc-bdd6-cf86b831bfd2︠
li_minus_pi.plot(plot_points=B) + v2.plot(color='red', plot_points=B) + plot(sqrt(2/pi)*sqrt(x/log(x)), (2, B), color='purple')
︡9fc4ff34-6133-4677-8ad9-e46d0f1d9d04︡{"once":false,"file":{"show":true,"uuid":"f423b96b-ecc0-49dc-9309-1b2b4494b639","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_Hafkbr.png"}}︡
︠eba6b983-afae-474f-b06f-78e259c2f697︠
li_minus_pi=5101648384.7155276
x = 4*10^22
N(sqrt(2/pi)*sqrt(x/log(x))) - li_minus_pi
︡b53030f9-33b8-43e5-a087-11b2a4bf3464︡{"stdout":"1.70185084142047e10\n"}︡
︠3f594ff7-565d-4f39-b1b1-63ae8152ed15︠
li = 783964159852157952242.7155
N(sqrt(2/pi)*sqrt(li)) - li_minus_pi
︡00ce381f-dfc3-403c-98e6-a6ba1ac148ea︡{"stdout":"1.72386086637032e10\n"}︡
︠e0fa4620-aa9a-42e2-a196-5f4201ed2357︠

︠8a08f9f4-0e4c-40d0-a56c-9ccc259bc5a6︠


v3 = stats.TimeSeries([0]+[v2[i]/sqrt(i-1) for i in [2..len(v2)-1]])
︡44ee13fb-ebec-4d16-9f8a-9b7294a50070︡{"once":false,"file":{"show":true,"uuid":"fd30f4e5-906d-4a2d-a087-3e7f056ca561","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_uUXL6h.png"}}︡
︠982aafe5-fe05-4e3a-a757-9a3f7e2c8756︠
%var x
v.plot(plot_points=B) + v2.plot(color='red', plot_points=B) + plot(sqrt(x)/log(x), (2, B), color='purple')
︡a49f80a8-f73b-420b-837d-a02cd6789526︡{"once":false,"file":{"show":true,"uuid":"8f28ab0f-8909-41d4-8256-5d5283a56959","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_ZeTlBN.png"}}︡
︠5e3daca0-0252-4c32-a40d-9793c3d275a3︠

︠da657687-cf1a-400a-83b0-17d06f08f43b︠
v3.plot()
︡eb9a31d4-0313-4a2d-b2bd-8be19064d834︡{"once":false,"file":{"show":true,"uuid":"134e0dd2-5216-4709-b17e-457e75a8d70e","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_YTyH2a.png"}}︡
︠c986e740-9845-403b-a882-47b36c36fedb︠
v4 = stats.TimeSeries([v3[i]*log(i-1) for i in [3..len(v3)-1]])
︡8361f801-9fb5-44b3-b1d4-ad74116d7b41︡
︠1f21f018-c2c3-44ab-af49-23451cb9b6e6︠
v4.plot()
︡7eb19c95-51e1-41c4-b2cc-2c1195dc3beb︡{"once":false,"file":{"show":true,"uuid":"66795add-c2cc-4eb5-9953-c18aae85411d","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_zzCAIk.png"}}︡
︠8a8d5bb3-c408-4890-b8df-d437218011c1︠
v4[-1]/20000
︡92b9c1f6-8647-4d9b-8f13-3bc617fef8df︡{"stdout":"6.024322782230395e-05\n"}︡
︠7bf07aab-8021-4a17-a17d-cf75119211d7︠
N(sqrt(10000))
︡7acd3931-b786-49a1-8afb-015adc9d4e9b︡{"stdout":"100.000000000000\n"}︡
︠e3282989-d714-4fac-8390-c11a557cf813︠
5101648384
10^11
︡9ce47a65-1aaf-421a-a81b-c4ba1fe858e9︡{"stdout":"5101648384\n"}︡{"stdout":"100000000000\n"}︡
︠4d7789e0-4eae-4fdd-b467-47d5f54764a1︠
12/sqrt(10000)
︠fdb5d3de-f211-4405-b671-48fcecd644ed︠
len(v)
︡26dd404d-a833-496a-8799-dbe05359de4d︡{"stdout":"9999\n"}︡
︠d43dd943-d6ca-4936-811d-3b8c718feb66︠
v.plot(plot_points=10000)
︡e72a060a-3421-4038-9412-0017610414f1︡{"once":false,"file":{"show":true,"uuid":"f7f6cda6-0232-4174-82c2-bebbbaa3a482","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_eHmhXo.png"}}︡
︠b7cb3784-b680-4175-b765-24bde5d571c0︠
list(v[:20])
︡621bacb3-55ee-42e4-ab08-1752c36c920d︡{"stdout":"[-1.0, -0.8815751854503011, -0.0775786850784419, -0.41057547008484097, 0.1770586104216081, -0.2881120141198865, 0.20855451944143866, 0.6760739727100677, 1.1204357246698047, 0.545845435603721, 0.9553838412940756, 0.35138416807063333, 0.7356618154418326, 1.109661078651051, 1.4745526835935667, 0.8313008199008909, 1.1807105326411023, 0.5234620527702756, 0.8601361975153274, 1.1912335155313478]\n"}︡
︠d4f95cbc-9a2d-4855-a566-4f40c40665ea︠
v[:20].mean()
︡c65188d6-1873-4490-973d-6e17274702d8︡{"stdout":"0.4641806806761636\n"}︡
︠924fdaec-0678-4975-94ba-d320e8914b11︠
B = 20000
v = stats.TimeSeries([Li(n) - prime_pi(n) for n in [2..B]])
v2 = stats.TimeSeries([0]+[v[:i].mean() for i in range(1,len(v))])
v.plot(plot_points=B) + v2.plot(color='red', plot_points=B) + plot(sqrt(x)*log(x), (2, B), color='purple')
︡7a23d83b-69ba-4132-8820-ad4b08e94e67︡{"once":false,"file":{"show":true,"uuid":"17bbfedf-3074-4d45-a167-c1f2f7119ed0","filename":"/projects/54949eee-57da-4bd7-bb43-c2602b429f9a/.sage/temp/compute17a/30091/tmp_izdPFw.png"}}︡
︠71267ec1-359d-4944-99f5-c9f9f796b277︠
x=10^8
z = N(Li(x) - prime_pi(x))

︡72acefdf-22e9-493a-922a-09edb612100d︡
︠4d70b8bd-c3ab-4bc1-85ea-2d061096d638︠
z
︡e9c09366-7e34-437d-889c-cd45ca3cd55c︡{"stdout":"753.330284251233\n"}︡
︠81959d89-f765-4d19-892b-6464514370bb︠
N(sqrt(x)*log(x))
︡f37cb83f-ca08-4bdc-a56f-2999e08d2892︡{"stdout":"184206.807439524\n"}︡
︠918cb7d2-d6ef-4d56-8ba7-37d468344c5c︠
x
︡bdc64ff3-6a06-4703-b3e4-86dc749881bf︡{"stdout":"100000000\n"}︡
︠618b313c-5586-445f-ac57-156b4da231c9︠









