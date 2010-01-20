-----------------------------------
--	Author: ReaperX
-- 	Sagheera
-- 	Limbus NPC
--  All functions implemented. The wait period for an upgrade has been set to
--  1 RL minute. This will need to be changed when we have a working conquest system.

--  Potential time zone issue, see below.

--  Like on retail, she won't give you information about relic upgrades, or accept
--  materials for these until you have spoken to her wearing a relic.
--  see http://wiki.ffxiclopedia.org/wiki/Category:Relic_Armor_%2B1 .

--------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/Utils");
require("scripts/globals/Gearsets");
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
require("scripts/zones/Port_Jeuno/TextIDs");

threedays = 0x3F480; -- 3 days, in seconds.
deltaT = 1010070000;  -- subtracting this constant converts UNIX standard time, in seconds since midnight UTC January 1st, 1970, 
					  -- into time measured in seconds since 8am, January 3rd, 2002, Arizona time (which is where I live).
-- The constant will be different if the server runs in a different time zone. There will need to be adjustments for that. 
-- Further complications could arise if client and server run in different time zones. 

CosmoCleanse = 0x2DE;
AncientBeastcoin = 0x753;

TukukuWhiteshell = 0x5A9;
OrdelleBronzepiece = 0x5AC;
OneByneBill = 0x5AF;

FlawlessRibbon = 0x3B8C;
LoquaciousEarring = 0x39DC;
BrutalEarring = 0x39DD;
ChargerMantle = 0x3C73;
JaegerMantle = 0x3C74;
BoxersMantle = 0x3C75;
GunnersMantle = 0x3C80;
StealthEarring = 0x39DF;
MusicalEarring = 0x3E59;
MetalChip = 0x84F;
		
ABitems = { FlawlessRibbon, LoquaciousEarring, BrutalEarring, ChargerMantle, JaegerMantle, BoxersMantle, GunnersMantle, StealthEarring, MusicalEarring, MetalChip }
ABitemcost = { 150, 75, 75, 150, 150, 75, 75, 75, 75, 75, 75 }
		
-- Upgrade items, ordered by job. First one is Temenos, second is Apollyon.
		
EcarlateCloth = 0x78A;
ArgyroRivet = 0x78B;
UtopianGoldThread = 0x78C;
AncientBrassIngot = 0x78D;
BenedictSilk = 0x78E
BenedictYarn = 0x78F;
DiabolicSilk = 0x790;
DiabolicYarn = 0x791;
RubySilkThread = 0x792;
CardinalCloth = 0x793;
SuppleSkin = 0x794;
LightFilament = 0x795;
SnowyCermet = 0x796;
WhiteRivet = 0x797;
DarkOrichalcumIngot = 0x798;
BlackRivet = 0x799;
SmaltLeather = 0x79A;
FetidLanolinCube = 0x79B;
CoiledYarn = 0x79C;
BrownDoeskin = 0x79D;
ChameleonYarn = 0x79E;
CharcoalCotton = 0x79F;
ScarletOdoshi = 0x7A0;
Kurogane = 0x7A1;
PlaitedCord = 0x7A2;
EbonyLacquer = 0x7A3;
CobaltMythril = 0x7A4;
BlueRivet= 0x7A5;
GlitteringYarn = 0x7A6;
AstralLeather = 0x7A7;

LuminianThread = 0xA60;
FlameshunCloth = 0xA61;
SilkwormThread = 0xA62;
CanvasToile = 0xA63;
PantinWire = 0xA64;
CorduroyCloth = 0xA65;

FiletLace = 0xA9A;
GoldStud = 0xA9B;
Brilliantine = 0xA9C;
ElectrumStud = 0xA9D;

-- AF upgrade items, separated and indexed by job

Temenos_item = {EcarlateCloth, UtopianGoldThread, BenedictSilk, DiabolicSilk, RubySilkThread, SuppleSkin,
SnowyCermet, DarkOrichalcumIngot, SmaltLeather, CoiledYarn, ChameleonYarn, ScarletOdoshi, PlaitedCord, 
CobaltMythril, GlitteringYarn, LuminianThread, SilkwormThread, PantinWire, FiletLace, Brilliantine }

Apollyon_item = {ArgyroRivet, AncientBrassIngot, BenedictYarn, DiabolicYarn, CardinalCloth, LightFilament,
WhiteRivet, BlackRivet, FetidLanolinCube, BrownDoeskin, CharcoalCotton, Kurogane, EbonyLacquer,
BlueRivet, AstralLeather, FlameshunCloth, CanvasToile, CorduroyCloth, GoldStud, ElectrumStud }

-- Crafted AF upgrade items.

DarkBronzeSheet = 0x7C6;
ManticoreLeather = 0x45D;
SilverBrocade = 0x7C7;
EtherCotton = 0x7CA;
HolyLeather = 0x7C8;
EtherLeather = 0x7C9;
RainbowVelvet = 0x7CC;
EtherHolly = 0x7CB;
TigerLeather = 0x357;
Sailcloth = 0x7CD;
SheepChammy= 0x7CE;
GoldIngot = 0x2E9;
GoldBrocade = 0x7CF;
BlessedMythrilSheet = 0x29B;
DarksteelSheet = 0x298;
DarkAdamanSheet = 0x7D1;
BeastHorn = 0x7D2;
WhiteMouton = 0x7D3;
DhalmelLeather = 0x350;
GoldThread = 0x337;
HuntersCotton  = 0x7D5;
CoeurlLeather = 0x1FA;
GoldSheet = 0x2F0;
IyoScale = 0x7D6;
LaminatedBuffaloLeather = 0x7D7;
LightweightSteelSheet  = 0x7D8;
LaminatedRamLeather = 0x7DC;
RamLeather = 0x353;
CoralHorn = 0x7D9;
WolfFelt = 0x7DA;
AncientLumber = 0x2D0;
KhromatedLeather = 0xA8F;
WamouraCloth = 0x8F1;
OilSoakedCloth = 0xA90;
MaridLeather = 0x868;
Foulard = 0xA91;
ScarletLinen = 0x6A3;
SilkySuede = 0xAB1;
ElectrumIngot = 0x9E8;
LynxLeather = 0x9E2;
KarakulCloth = 0x8F0;

-- Crafted Items, indexed in the same way as parameter 2 of 0x136 (see below).

Crafted_itemsAF = { 
DarkBronzeSheet, DarkBronzeSheet, DarkBronzeSheet, DarkBronzeSheet, DarkBronzeSheet,
ManticoreLeather, SilverBrocade, ManticoreLeather, ManticoreLeather, TigerLeather,
EtherCotton, HolyLeather, EtherLeather, RainbowVelvet, EtherHolly,
EtherLeather, EtherLeather, EtherLeather, EtherCotton, EtherHolly,
RainbowVelvet, RainbowVelvet, RainbowVelvet, RainbowVelvet, TigerLeather,
Sailcloth, Sailcloth, SheepChammy, Sailcloth, SheepChammy, 
GoldIngot, GoldBrocade, BlessedMythrilSheet, BlessedMythrilSheet, BlessedMythrilSheet,
DarksteelSheet, DarkAdamanSheet, DarksteelSheet, DarksteelSheet, DarksteelSheet,
BeastHorn, WhiteMouton, WhiteMouton, DhalmelLeather, DhalmelLeather,
GoldThread, ManticoreLeather, ManticoreLeather, ManticoreLeather, ManticoreLeather,
HuntersCotton, HuntersCotton, CoeurlLeather, CoeurlLeather, TigerLeather,
GoldSheet, IyoScale, LaminatedBuffaloLeather, LaminatedBuffaloLeather, LaminatedBuffaloLeather,
LightweightSteelSheet, LightweightSteelSheet, LightweightSteelSheet, LaminatedBuffaloLeather, LightweightSteelSheet,
LaminatedRamLeather, LaminatedRamLeather, RamLeather, RamLeather, RamLeather,
CoralHorn, WolfFelt, WolfFelt, WolfFelt, AncientLumber,
KhromatedLeather, WamouraCloth, KhromatedLeather, WamouraCloth, KhromatedLeather,
LaminatedRamLeather, OilSoakedCloth, OilSoakedCloth, OilSoakedCloth, MaridLeather,
Foulard, ScarletLinen, Foulard, Foulard, EtherLeather, 
GoldIngot, ScarletLinen, GoldIngot, SilkySuede, SilkySuede,
ElectrumIngot, LynxLeather, LynxLeather, EtherLeather, KarakulCloth }

-- Additional crafted items needed for relic upgrades.

GriffonLeather = 0x5B3;
OvinnikLeather = 0x84A;
PeisteLeather = 0x9EA;
CatoblepasLeather = 0x84C;
MammothTusk = 0x5B2;
YellowMouton = 0x84D;
SmoothVelvetCloth = 0x6A6;
Cilice= 0x9E9;
PlatinumIngot = 0x2EA;
IncombustibleWool = 0x978;

Crafted_itemsRelic = { 
DarkBronzeSheet, DarkBronzeSheet, DarkBronzeSheet, DarkBronzeSheet, DarkBronzeSheet,
OvinnikLeather, SilverBrocade, OvinnikLeather, OvinnikLeather, OvinnikLeather,
EtherCotton, HolyLeather, EtherLeather, RainbowVelvet, EtherHolly,
EtherLeather, EtherLeather, EtherLeather, EtherCotton, EtherHolly,
RainbowVelvet, RainbowVelvet, RainbowVelvet, RainbowVelvet, OvinnikLeather,
Sailcloth, Sailcloth, SheepChammy, Sailcloth, SheepChammy, 
GoldIngot, GoldBrocade, BlessedMythrilSheet, BlessedMythrilSheet, BlessedMythrilSheet,
DarksteelSheet, DarkAdamanSheet, DarksteelSheet, DarksteelSheet, DarksteelSheet,
MammothTusk, YellowMouton, YellowMouton, CatoblepasLeather, CatoblepasLeather,
GoldThread, GriffonLeather, GriffonLeather, GriffonLeather, GriffonLeather,
HuntersCotton, HuntersCotton, CoeurlLeather, CoeurlLeather, OvinnikLeather,
GoldSheet, IyoScale, LaminatedBuffaloLeather, LaminatedBuffaloLeather, LaminatedBuffaloLeather,
LightweightSteelSheet, LightweightSteelSheet, LightweightSteelSheet, LightweightSteelSheet, LightweightSteelSheet,
LaminatedRamLeather, LaminatedRamLeather, RamLeather, RamLeather, RamLeather,
CoralHorn, WolfFelt, WolfFelt, WolfFelt, AncientLumber,
KhromatedLeather, SmoothVelvetCloth, KhromatedLeather, SmoothVelvetCloth, KhromatedLeather,
OvinnikLeather, OilSoakedCloth, OilSoakedCloth, OilSoakedCloth, MaridLeather,
Foulard, GoldBrocade, Foulard, Foulard, PeisteLeather, 
GoldIngot, Cilice, GoldIngot, SmoothVelvetCloth, HolyLeather,
PlatinumIngot, ScarletLinen, LynxLeather, EtherLeather, IncombustibleWool }

-- Ancient beastcoin cost of AF upgrades.

ABcost = {
20, 35, 15, 15, 25,
25, 40, 20, 25, 20,
30, 40, 20, 25, 20,
25, 25, 15, 30, 20,
20, 30, 15, 20, 25,
30, 40, 20, 30, 20,
25, 30, 20, 20, 20,
25, 30, 15, 20, 20,
30, 40, 20, 30, 20,
15, 40, 25, 25, 25,
25, 40, 20, 25, 25,
15, 25, 20, 30, 20,
20, 30, 15, 30, 15,
30, 40, 20, 25, 20,
25, 35, 20, 30, 15,
20, 30, 15, 30, 15,
30, 30, 20, 30, 25,
20, 30, 20, 20, 20,
30, 35, 25, 25, 20,
20, 40, 25, 25, 25 }

-- Ancient Currency cost of relic upgrades

ACcost = {
28, 28, 28, 28, 28,
26, 26, 26, 26, 26, 
28, 28, 28, 26, 28,
28, 28, 28, 28, 28,
22, 22, 22, 22, 26,
26, 26, 28, 26, 28,
20, 20, 30, 30, 30,
28, 20, 28, 28, 28,
30, 26, 26, 26, 26,
26, 28, 28, 28, 28,

30, 30, 30, 30, 26,
24, 22, 20, 20, 20,
26, 26, 26, 20, 26,
30, 30, 30, 30, 30,
30, 30, 30, 30, 28,
26, 26, 26, 26, 26,
30, 30, 30, 30, 30,
26, 26, 26, 26, 26,
30, 30, 30, 30, 30,
28, 28, 28, 28, 28
}

ACtype = {
OneByneBill, 
OneByneBill, 
OrdelleBronzepiece,
TukukuWhiteshell,
OrdelleBronzepiece,
TukukuWhiteshell,
OrdelleBronzepiece,
OneByneBill,
TukukuWhiteshell,
OneByneBill,

TukukuWhiteshell,
OneByneBill,
OneByneBill,
OrdelleBronzepiece,
TukukuWhiteshell,
OrdelleBronzepiece,
OneByneBill,
TukukuWhiteshell,
OrdelleBronzepiece,
OneByneBill
}

function isWearingRelicArmor(player)
	relicfound = nil;
	n = 5; -- first slot to check- head.
	k = 0;
	equippeditem = player:getEquip(n);
	while not(relicfound) and (n <= 9) and (k <= 19 ) do
		--print("comparing item in slot", slotstocheck[n], "( ",equippeditem,") to ",Relicgear[n+5*k]);
		relicfound = (equippeditem == Relicgear[(n-4)+5*k]);
		k = k + 1;
		if (k == 20) then
			k = 0;
			n = n + 1;
			equippeditem = player:getEquip(n);
		end;
	end;
	if relicfound then
		return 1;
	else
		return 0;
	end;
end;

-- Input Parameters for 0x136:
-- parameter 1: 
--- 0xFFFFFFFF introduces herself but refuses to do business since you're not a seasoned adventurer. 
--  This seems to be an exceptional value. Otherwise, param1 appears to be a bitmask:

--- bit 0: set = just the menu. not set = introductory dialog (+ menu)
--- bit 1: toggles between these two menu configurations: 
-- 0: "ask about detergent"  vs. 1: "buy detergent"
--                                  "ask about AF restoration"
--                                  "ask about AB"
-- in other words, 1 means you haven't heard about AF restoration yet. 
-- bit 2: if set, she tells you how many ABs you have turned in when you ask her about ABs. Otherwise, she gives you the 
-- introductory lecture on ABs.
-- bit 3: if not set, she gives you a long lecture on how incredibly rare relics are when you ask about relic armor upgrades. 
-- Setting this bit turns it off and gives you just the menu for relic armor upgrades.
-- bit 4: if this is set, it triggers her speech about herself, and then she talks about relics.
-- bit 5: turns off her interest in relics when set. 

--- some more special values that suggest undiscovered bit functions:
--- = 0x90,b0,f0,f2,f4: introduces herself and then asks about relic armor.
--- = 0xFA, FC have you decided to entrust your relic armor to me? + menu about relic armor

-- parameter 2: when set to nonzero value: "I apologize for the wait. The restored {item parameter} just arrived.."
-- The K-th item of the AF    set of job N (K=1 head, K=2 body. K=3 hands, K=4 legs, K=5 feet) has param2 = 5*(N-1) + K, N = 1..20.
-- The K-th item of the relic set of job N (K=1 head, K=2 body. K=3 hands, K=4 legs, K=5 feet) has param2 = 100 + 5*(N-1) + K, N = 1..20.

-- parameter 3: set to nonzero value: tells you you have to wait longer for your upgraded item {param2}.

-- parameter 4: player's gil. Need at least 15k to buy detergent.

-- parameter 5: time when next cosmo-cleanse will be available, in seconds since 8am, January 3rd, 2002.

-- parameter 6: the current time + 3 days, in seconds since 8am, January 3rd, 2002.
-- (no idea why it has to be so convoluted, but that's the data this event needs to compute whether to offer another cosmo.)

-- parameter 7: nonzero value = player already has cosmo-cleanse.

-- parameter 8: number of ancient beastcoins the player has turned in.

function onTrigger(player,npc)
event = Event(0x136);
if (SeaAccess(player) == 1) then
		
	-- first of all pull some information about player's interaction history.
	
	becomes_available = player:getVar("COSMO_LAST_BOUGHT")+threedays-deltaT; -- when will next cosmo cleanse become available?
	AB = player:getVar("ANCIENT_BEASTCOINS");		-- number of ancient beastcoins deposited with her.
	SagheeraAB = player:getVar("SAGHEERA_AB");		-- 1 if the player has already heard her explanation of ancient beastcoins.
	
	Bit0 = player:getVar("SAGHEERA_BIT0");			-- 1 if the player has already heard her self-introduction after getting sea.
	Bit1 = player:getVar("SAGHEERA_BIT1");			-- 1 if the player has already heard her explanation of AF upgrades.
	Bit3 = player:getVar("SAGHEERA_BIT3");			-- 1 if the player has already heard her explanation of relic upgrades.
	
	if (player:getVar("SAGHEERA_BIT5REV") == 0) then  	-- has she seen us yet with a relic? No->
		--- now we need to check whether the player is wearing a relic.
		--print("is wearing relic armor: ",isWearingRelicArmor(player));
		if (isWearingRelicArmor(player) == 1) then
			player:setVar("SAGHEERA_BIT5REV",1);	-- this is the first time player is talking to her while wearing a relic.
		end;
	end;
	Bit5 = 1-player:getVar("SAGHEERA_BIT5REV"); 	-- Controls relic option in the menu. The logic of this bit is reversed for some reason.
	
	if (Bit0 == 0 ) and (Bit5 == 0) then -- if we're talking to her for the first time AND wearing a relic, there is a special
		Bit4 = 1;									   -- version of her introduction that this bit triggers.
	else 
		Bit4 = 0;
	end;
	upgrading = player:getVar("SAGHEERA_UPGRADING"); -- The number of the item currently being upgraded, if any.
	param3 = 0;
	if (upgrading > 0) then
		upgrade_time = os.time() - player:getVar("SAGHEERA_UPG_STARTED");
		if (upgrade_time <= 60) then -- 1 minute wait to upgrade - this will need to be fixed and tied to the weekly conquest update eventually.
			param3 = 1;
		end;
	end;
	param1 = Bit0 + 2*Bit1  + 4*SagheeraAB + 8*Bit3 + 16*Bit4 + 32*Bit5;
	event:setParams(param1,upgrading,param3,player:getCurrGil(),becomes_available,os.time() + threedays -deltaT,player:hasKeyItem(CosmoCleanse),AB)
else
	event:setParams(0xFFFFFFFF) -- for players that don't have sea access. She doesn't consider them real adventurers.
end;
player:startEvent(event);--]]
end; 
 
function onEventSelection(player,csid,option) 
if (csid == 0x136) then
	if (option >= 1) and (option <= 100) then
		job =  math.floor((option-1)/5) + 1;
		player:updateEvent(AFp1gear[option],AFgear[option],Temenos_item[job],Apollyon_item[job],Crafted_itemsAF[option],0,0,ABcost[option]);
	elseif (option >= 101) and (option <= 200) then
		op = option - 100;
		job =  math.floor((op-1)/5) + 1;
		--print("job = ",job);
		player:updateEvent(Relicp1gear[op],Relicgear[op],Relicm1gear[op],Crafted_itemsRelic[op],ACtype[job],ACcost[op],3,8);
	end;
end
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
howmanyitems = trade:getItemCount()
howmanyAB = trade:getItemQty(AncientBeastcoin)
SagheeraAB = player:getVar("SAGHEERA_AB");
--print("Number of items traded:", howmanyitems);
if (howmanyitems == howmanyAB) and (SagheeraAB == 1) then -- she only accepts ABs if you have heard her explanation.
	event = Event(0x137);
	AB = player:getVar("ANCIENT_BEASTCOINS");
	AB = AB + howmanyAB;
	player:setVar("ANCIENT_BEASTCOINS", AB);
	event:setParams(howmanyAB, 0, 0, 0, 0, 0, 0, AB);
	trade:isComplete();
	player:startEvent(event);
elseif (howmanyitems == 4) then
	event = Event(0x138);
	item = 0;
	job = 0;
	match = nil;
	while (job <= 19) and not(match) do
		job = job + 1;
		match = (trade:hasItemQty(Temenos_item[job],1)) and (trade:hasItemQty(Apollyon_item[job],1)) 
	end;
	if (match) then 
		slot = 0;
		slotmatch = nil;
		while (slot <= 4) and not(slotmatch) do
			slot = slot + 1;
			item = (job-1)*5+slot;
			slotmatch = (trade:hasItemQty(AFgear[item],1)) and (trade:hasItemQty(Crafted_itemsAF[item],1)) 
		end;
	end;	
	if slotmatch then
		cost = ABcost[item];
		AB = player:getVar("ANCIENT_BEASTCOINS");
		if (AB >= cost) then
			player:setVar("SAGHEERA_UPGRADING",item);
			player:setVar("SAGHEERA_UPG_STARTED",os.time());
			AB = AB - cost;
			player:setVar("ANCIENT_BEASTCOINS", AB);
			trade:isComplete();
			player:startEvent(event);
		else
			player:showText(npc,1639);	-- You have collected the proper materials, but unfortunately you lack the required amount..
		end;
	else
		--print("no AF upgrade recipe match.");
	end;
elseif (player:getVar("SAGHEERA_BIT5REV") == 1) and (howmanyitems >= 23) and 
((trade:getItemQty(OneByneBill) > 0) or (trade:getItemQty(TukukuWhiteshell) > 0) or (trade:getItemQty(OrdelleBronzepiece) > 0)) then 
	event = Event(0x138);
	item = 0;
	slotmatch = nil;
	while (item <=100) and not(slotmatch) do
		item = item + 1;
		job =  math.floor((item-1)/5) + 1;
		--print("item, job = ",item,job);
		slotmatch = (trade:hasItemQty(Relicgear[item],1)) and (trade:hasItemQty(Relicm1gear[item],1)) 
		and (trade:hasItemQty(Crafted_itemsRelic[item],1)) and (trade:hasItemQty(ACtype[job],ACcost[item]))
	end;
	if slotmatch then
		player:setVar("SAGHEERA_UPGRADING",item+100);
		player:setVar("SAGHEERA_UPG_STARTED",os.time());
		trade:isComplete();
		event:setParams(0,0,0,0,0,0,1,0);
		player:startEvent(event);
	else
		--print("Currency trade suggests relic upgrade but no upgrade recipe match.");
	end;
end;
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x136) then
	player:setVar("SAGHEERA_BIT0",1); -- she's introduced herself now.
	if (option == 1) then -- we've heard her sales pitch on artifact upgrades
		player:setVar("SAGHEERA_BIT1",1); -- .. which unlocks that part of the menu.
	elseif (option == 2) then -- player asked about Ancient Beastcoins and heard her lecture about them.
		player:setVar("SAGHEERA_AB",1);
	elseif (option == 3) then -- player is buying a Cosmo Cleanse.
		player:addKeyItem(CosmoCleanse);
		player:specialMessage(KEYITEM_OBTAINED, CosmoCleanse);
		player:removeGil(15000); -- price is hardcoded since it's hardcoded into the dialog.
		player:setVar("COSMO_LAST_BOUGHT",os.time());
	elseif (option == 4) then -- player asked about relic restoration and heard her lecture about it.
		player:setVar("SAGHEERA_BIT3",1); 
	elseif (option >= 11) and (option <= 20) then -- player is buying an item with ABs.
		AB = player:getVar("ANCIENT_BEASTCOINS");
		player:addItem(ABitems[option-10]);
		player:specialMessage(ITEM_OBTAINED, ABitems[option-10]);
		AB = AB - ABitemcost[option-10];
		player:setVar("ANCIENT_BEASTCOINS",AB);
	elseif (option == 100) then	-- upgdaded item has arrived!!
		upgrading = player:getVar("SAGHEERA_UPGRADING");
		if (upgrading <= 100) then
			player:addItem(AFp1gear[upgrading]);
			player:specialMessage(ITEM_OBTAINED, AFp1gear[upgrading]);
		else
			player:addItem(Relicp1gear[upgrading-100]);
			player:specialMessage(ITEM_OBTAINED, Relicp1gear[upgrading-100]);
		end;
		player:setVar("SAGHEERA_UPGRADING",0);
		player:setVar("SAGHEERA_UPG_STARTED",0);
	end;
end;
end;