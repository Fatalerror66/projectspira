--------------------------------------
--Orignal Author: Mana
--Fishing related globals
--------------------------------------

require("/scripts/globals/common");

function getFishByBait(bait,zone)
--  BAIT
	sliceofbluetail = 16992
	peeledcrayfish = 16993
	sliceofmoatcarp = 16994
	pieceofrottenmeat = 16995
	ballofsardinepaste = 16996
	ballofcrayfishpaste = 16997
	ballofinsectpaste = 16998
	balloftroutpaste = 16999
	meatball = 17000
	giantshellbug = 17001
	robberrig = 17002
	superscoop = 17003
	judgeminnow = 17004
	lufaisefly = 17005
	drillcalamary = 17006
	dwarfpugil = 17007
	sliceofsardine = 17392
	sliceofcod = 17393
	peeledlobster = 17394
	lugworm = 17395
	littleworm = 17396
	shellbug = 17397
	roguerig = 17398
	sabikirig = 17399
	sinkingminnow = 17400
	lizardlure = 17401
	shrimplure = 17402
	froglure = 17403
	wormlure = 17404
	flylure = 17405
	judgeslure = 17406
	minnow = 17407
	
-- FISH
	zebraeel = 4288
	forestcarp = 4289
	elshimofrog = 4290
	sandfish = 4291
	grimmonite = 4304
	ryugutitan = 4305
	giantdonko = 4306
	junglecatfish = 4307
	giantchirai = 4308
	cavecherax = 4309
	tinygoldfish = 4310
	blackbubbleeye = 4311
	lionhead = 4312
	blindfish = 4313
	bibikibo = 4314
	lungfish = 4315
	trilobite = 4317
	bibikiurchin = 4318
	tricorn	= 4319
	shiningtrout = 4354
	bastoresardine = 4360
	nebimonite = 4361
	chevalsalmon = 4379
	goldlobster = 4383
	blacksole = 4384
	zafmlugbass = 4385
	bluetail = 4399
	moatcarp = 4401
	redterrapin = 4402
	yellowglobe = 4403
	tricolorcarp = 4426
	goldcarp = 4427
	giantcatfish = 4469
	darkbass = 4428
	blackeel = 4429
	armoredpisces = 4316
	cobaltjellyfish = 4443
	silvershark = 4451
	emperorfish = 4454
	bastorebream = 4461
	monkeonke = 4462
	takitaro = 4463
	pipira = 4464
	icefish = 4470
	bladefish = 4471
	crayfish = 4472
	crescentfish = 4473
	gigantsquid = 4474
	seazombie = 4475
	titanictus = 4476
	gavialfish = 4477
	threeeyedfish = 4478
	bhefhelmarlin = 4479
	gugrutuna = 4480
	ogreeel = 4481
	nosteauherring = 4482
	tigercod = 4483
	shallshell = 4484
	noblelady = 4485
	greedie = 4500
	fatgreedie = 4501
	quus = 4514
	copperfrog = 4515
	crystalbass = 4528
	elshimonewt = 4579
	coralbutterfly = 4580
	titanicsawfish = 5120
	moorishidol = 5121
	bibikislug = 5122
	jacknife = 5123
	tropicalclam = 5124
	Phanauetnewt = 5125
	muddysiredon = 5126
	gugrusaurus = 5127
	conecalamary = 5128
	lik = 5129
	tavnaziangoby = 5130
	vongolaclam = 5131
	gurnard = 5132
	pterygotus = 5133
	molamola = 5134
	rhinochimera = 5135
	istavrit = 5136
	turnabaligi = 5137
	blackghost = 5138
	betta = 5139
	kalkanbaligi = 5140
	veydalwrasse = 5141
	redbubbleeye = 5446
	denizanasi = 5447
	kalamar = 5448
	hamsi = 5449
	lakerda = 5450
	kilicbaligi = 5451
	uskumru = 5452
	istakoz = 5453
	mercanbaligi = 5454
	ahtapot = 5455
	istiridye = 5456
	dil = 5457
	yilanbaligi = 5458
	sazanbaligi = 5459
	kayabaligi = 5460
	alabaligi = 5461
	morinabaligi = 5462
	yayinbaligi = 5463
	kaplumbaga = 5464
	caedarvafrog = 5465
	trumpetshell = 5466
	megalodon = 5467
	matsya = 5468
	brassloach = 5469
	pirarucu = 5470
	gerrothorax = 5471
	garpike = 5472
	bastoresweeper = 5473
	cacuong = 5474
	gigantoctopus = 5475
	abaia = 5476
	
-- CREATE GLOBAL FISH POOL	
	switch (bait) : caseof {
		-- fishpool = { # of fish, fish1, fish2, etc... }
		-- fish are in order by skill based on the Kida's fishing database
		-- 
		[littleworm] = function (x) fishpool = {23,brassloach,cacuong,cobaltjellyfish,denizanasi,crayfish,moatcarp,forestcarp,tricolorcarp,blindfish,giantcatfish,lungfish,darkbass,crystalbass,blackeel,yilanbaligi,icefish,sandfish,monkeonke,goldcarp,sazanbaligi,tavnaziangoby,kayabaligi,armoredpisces}; end,
		[drillcalamary] = function (x) fishpool = {4,cobaltjellyfish,seazombie,gugrusaurus,matsya}; end,
		[dwarfpugil] = function (x) fishpool = {2,cobaltjellyfish,lik}; end,
		[lufaisefly] = function (x) fishpool = {6,phanauetnewt,cobaltjellyfish,muddysiredon,lungfish,tricorn,gerrothorax}; end,
		[ballofcrayfishpaste] = function (x) fishpool = {17,bibikiurchin,bastoresweeper,cobaltjellyfish,greedie,gurnard,yellowglobe,fatgreedie,nebimonite,moorishidol,zafmlugbass,shallshell,vongolaclam,trumpetshell,gigantoctopus,bastorebream,grimmonite,kalkanbaligi}; end,
		[sliceofbluetail] = function (x) fishpool = {16,bibikiurchin, bastoresweeper,cobaltjellyfish,denizanasi,bibikibo,veydalwrasse,conecalamary,kalamar,bhefhelmarlin,kilicbaligi,bladefish,silvershark,gigantsquid,ryugutitan,gugrusaurus,molamola}; end,
		[peeledcrayfish] = function (x) fishpool = {17,cobaltjellyfish,crayfish,moorishidol,bibikibo,darkbass,crystalbass,blackeel,giantdonko,monkeonke,vongolaclam,trilobite,gigantoctopus,gavialfish,emperorfish,blacksole,cavecherax,takitaro}; end,
		[ballofinsectpaste] = function (x) fishpool = {11,cobaltjellyfish,moatcarp,tinygoldfish,forestcarp,tricolorcarp,blindfish,darkbass,crystalbass,sandfish,goldcarp,sazanbaligi}; end,
--		[] = function (x) fishpool = {}; end,
	default = function (x) end, }
	n = 1
	while n < fishpool[1] do
		n = n+1
		--print(fishpool[n])
	end
   
	return (fishpool)
end