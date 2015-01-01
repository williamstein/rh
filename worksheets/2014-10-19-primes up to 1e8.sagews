︠04cf8477-5554-4dc1-bcab-565e40b6bf3es︠
%time v = prime_range(10^8)
︡621c8795-f1a9-4702-a883-ff20616face5︡{"stdout":"CPU time: 1.42 s, Wall time: 1.42 s"}︡{"stdout":"\n"}︡
︠591c3f95-ade5-4d50-a74b-132e11734e18s︠
%time gaps = [v[i]-v[i-1] for i in range(1,len(v))]
︡75dceeca-3547-48e2-bd26-bf4c1961162d︡{"stdout":"CPU time: 25.78 s, Wall time: 25.79 s"}︡{"stdout":"\n"}︡
︠2a4ecf9b-3b90-40ef-9168-dd94b29f5408s︠
max(gaps)
︡4a6a9b4f-8c1d-400f-9200-11bb0d7783a6︡{"stdout":"220"}︡{"stdout":"\n"}︡
︠67fb29e4-606c-49f3-9747-9d0fc6e560f2︠
