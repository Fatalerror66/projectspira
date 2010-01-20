-----------------------------------
--	Author: Arcanedemon (Cut&Paste from Tenjou)
-- 	FISHING GUILD ITEMS
-- 	Acts as a database for guild point items.  Customizing is ok.
-----------------------------------

fishingDB = {
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
0,	0x1108,	0x0000,	24,	0000,	1200,	
0,	0x10DA,	0x0000,	300,	0000,	2560,	
0,	0x115B,	0x0000,	24,	0000,	1200,	
0,	0x1178,	0x0000,	30,	0000,	1280,	
0,	0x1131,	0x0000,	30,	0000,	1280,	
0,	0x1405,	0x0000,	12,	0000,	1120,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
1,	0x10D9,	0x0000,	675,	0000,	3760,	
1,	0x111B,	0x0000,	60,	0000,	1680,	
1,	0x11A3,	0x0000,	60,	0000,	1680,	
1,	0x10C1,	0x0000,	45,	0000,	1600,	
1,	0x1194,	0x0000,	24,	0000,	1520,	
1,	0x11A2,	0x0000,	60,	0000,	1680,	
1,	0x1133,	0x0000,	60,	0000,	1680,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
2,	0x10C2,	0x0000,	156,	0000,	2320,	
2,	0x1175,	0x0000,	300,	0000,	2880,	
2,	0x10DB,	0x0000,	720,	0000,	4000,	
2,	0x1401,	0x0000,	714,	0000,	4000,	
2,	0x1109,	0x0000,	156,	0000,	2320,	
2,	0x1170,	0x0000,	138,	0000,	2240,	
2,	0x1183,	0x0000,	156,	0000,	2320,	
2,	0x114A,	0x0000,	156,	0000,	2320,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
3,	0x11E4,	0x0000,	375,	0000,	3280,	
3,	0x11B0,	0x0000,	375,	0000,	3280,	
3,	0x114C,	0x0000,	60,	0000,	2160,	
3,	0x1180,	0x0000,	300,	0000,	3040,	
3,	0x1182,	0x0000,	240,	0000,	2880,	
3,	0x1181,	0x0000,	96,	0000,	2320,	
3,	0x1102,	0x0000,	78,	0000,	2240,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
4,	0x10D2,	0x0000,	576,	0000,	3920,	
4,	0x111F,	0x0000,	576,	0000,	3920,	
4,	0x1176,	0x0000,	459,	0000,	3600,	
4,	0x116E,	0x0000,	900,	0000,	4480,	
4,	0x10C3,	0x0000,	78,	0000,	2400,	
4,	0x1121,	0x0000,	93,	0000,	2480,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
5,	0x117F,	0x0000,	900,	0000,	4560,	
5,	0x112F,	0x0000,	900,	0000,	4560,	
5,	0x11E3,	0x0000,	525,	0000,	3920,	
5,	0x114B,	0x0000,	900,	0000,	4560,	
5,	0x1132,	0x0000,	900,	0000,	4560,	
5,	0x10DD,	0x0000,	120,	0000,	2800,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
6,	0x1177,	0x0000,	1200,	0000,	5040,	
6,	0x1179,	0x0000,	1320,	0000,	5120,	
6,	0x1185,	0x0000,	1200,	0000,	5040,	
6,	0x10C0,	0x0000,	1200,	0000,	5040,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
7,	0x117D,	0x0000,	1500,	0000,	5360,	
7,	0x10D3,	0x0000,	1800,	0000,	5600,	
7,	0x1163,	0x0000,	1500,	0000,	5360,	
7,	0x117E,	0x0000,	1000,	0000,	4800,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
8,	0x116D,	0x0000,	1800,	0000,	5680,	
8,	0x1166,	0x0000,	1800,	0000,	5680,	
8,	0x117A,	0x0000,	1800,	0000,	5680,	
8,	0x10D0,	0x0000,	2100,	0000,	5840,	
--Rank,	NQItem,	HQItem,	NQVal,	HQVal,	Max
9,	0x10DC,	0x0000,	2850,	0000,	6240,	
9,	0x1120,	0x0000,	2100,	0000,	5840,	
9,	0x117B,	0x0000,	1400,	0000,	5360,	
9,	0x116F,	0x0000,	2100,	0000,	5840,	
9,	0x117C,	0x0000,	2100,	0000,	5840}

function getDailyItem(rank)
--Determine the item of the day, based on rank.
timer = os.time();
counter = -1;
while (timer > 1009810800) do
	timer = (timer-86400);
	counter = counter+1;
end
--print("Days:",counter);
--print("Rank for today:",counter%rank);
i = 1;
j = 0;
for i=1,(table.getn(fishingDB)/6) do
	if (fishingDB[(i*6)-5] == (counter%(rank+1))) then
		j=j+1;
		--print(i,j,fishingDB[(i*6)-4]);
	elseif (fishingDB[(i*6)-5] > (counter%(rank+1))) then
		k = i-1;
		--print("Breaking...",i,j,k);
		break;
	end
end
--print(k,(k*6)-4,(counter%j));
item = fishingDB[((k-(counter%j))*6)-4];
hqitem = fishingDB[((k-(counter%j))*6)-3];
nqpoints = fishingDB[((k-(counter%j))*6)-2];
hqpoints = fishingDB[((k-(counter%j))*6)-1];
value = fishingDB[((k-(counter%j))*6)];
return item,hqitem,nqpoints,hqpoints,value;
end;