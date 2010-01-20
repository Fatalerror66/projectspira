-- Functions for Conquest system, by ReaperX

WINDURST = 2;  -- convenience constants
BASTOK = 1;
SANDORIA = 0;
BEASTMEN = 3;

RONFAURE = 5;
ZULKHEIM = 6;
NORVALLEN = 7;
GUSTABERG = 8;
DERFLAND = 9;
SARUBATARUTA = 10;
KOLSHUSHU = 11;
ARAGONEU = 12;
FAUREGANDI = 13;
VALDEAUNIA = 14;
QUFIMISLAND = 15;
LITELOR = 16;
KUZOTZ = 17;
VOLLBOW = 18;
ELSHIMOLOWLANDS = 19;
ELSHIMOUPLANDS = 20;
TULIA = 21;
TAVNAZIA = 23;

rank = {} -- hardcoded rankings until the core supports conquest. 
rank[SANDORIA] = 2; 
rank[BASTOK] = 3;
rank[WINDURST] = 1; 

sandy_bastok_ally = 0; -- hardcoded alliance rankings until core supports conquest
sandy_windurst_ally = 0;
windurst_bastok_ally = 0;

region_control = {}  -- hardcoded values until core supports conquest

region_control[RONFAURE] = SANDORIA;
region_control[ZULKHEIM] = SANDORIA;
region_control[NORVALLEN] = SANDORIA;
region_control[GUSTABERG] = BASTOK;
region_control[DERFLAND] = WINDURST;
region_control[SARUBATARUTA] = WINDURST;
region_control[KOLSHUSHU] = WINDURST;
region_control[ARAGONEU] = SANDORIA;
region_control[FAUREGANDI] = BASTOK;
region_control[VALDEAUNIA] = BEASTMEN;
region_control[QUFIMISLAND] = BASTOK;
region_control[LITELOR] = BASTOK;
region_control[KUZOTZ] = SANDORIA;
region_control[VOLLBOW] = BEASTMEN;
region_control[ELSHIMOLOWLANDS] = SANDORIA;
region_control[ELSHIMOUPLANDS ] = BEASTMEN;
region_control[TULIA ] = WINDURST;
region_control[22] = -1;        -- (no such region)
region_control[TAVNAZIA] = BEASTMEN;

----------------------------------------------------------------
-- function getControlBitmask(nation) produces the supply quest mask for the nation based on the current conquest standings.
----------------------------------------------------------------

function getControlBitmask(nation)
mask = 0xFFFFFFFF;
for i = 5,23 do 
	if (region_control[i] == nation) then
		mask = mask - 2^i;
	end;
end
return mask;
end;

----------------------------------------------------------------
-- function getArg1(player) computes argument 1 for gate guard events. This number describes the function (including national
-- affiliation) of the guard.
-- lowest two hex digits:
--- 01 = San d'Oria
--- 11 = Bastok
--- 21 = Windurst
--- 
--- changing the first digit to something other than 1 makes the guard function as an outpost guard. 31, 41, etc. give you signet
--- automatically.

-- the 3rd and 4th hex digit controls signet services:
---00 = signet service availabe
---01 = signet service available due to alliance with Windurst
---02 = signet service available due to alliance with Bastok
---04 = signet service available due to alliance with San d'Oria
---07 = signet service unavailable
---other: auto-signet without menu.

-- I have not discovered the function of the highest 4 hex digits, if any.

-- example: windy gate guard, bastok citizen, no alliance: argument 1 = 0x0721.

-----------------------------------------------------------------

function getArg1(guardnation, player)
playernation = player:getNation();
if (guardnation == WINDURST) then
	output = 33;
elseif (guardnation == SANDORIA) then
	output = 1;
elseif (guardnation == BASTOK) then
	output = 17;
else 									-- For Jeuno guards, not yet researched.
	output = 0;
end;	
if (guardnation == playernation) then
	signet = 0;
elseif (playernation == WINDURST) then
	if ((guardnation == BASTOK) and (windurst_bastok_ally == 1)) or ((guardnation == SANDORIA) and (sandy_windurst_ally == 1)) then
		signet = 1;
	else
		signet = 7;
	end;
elseif (playernation == BASTOK) then
	if ((guardnation == WINDURST) and (windurst_bastok_ally == 1)) or ((guardnation == SANDORIA) and (sandy_bastok_ally == 1)) then
		signet = 2;
	else
		signet = 7;
	end;
elseif (playernation == SANDORIA) then
	if ((guardnation == WINDURST) and (sandy_windurst_ally == 1)) or ((guardnation == BASTOK) and (sandy_bastok_ally == 1)) then
		signet = 4;
	else
		signet = 7;
	end;
end;
output = output + 256*signet;
return output;
end;


------------------------------------------------
-- function conquest_ranking() computes part of argument 3 for gate guard events.
-- it represents the conquest standing of the 3 nations. Verified.
------------------------------------------------
function conquest_ranking()
output = rank[SANDORIA] + 4*rank[BASTOK]+16*rank[WINDURST];
return output;
end;
----------------------------------------------------------------
-- function getArg6(player) computes argument 6 for gate guard events. This number encodes a player's rank and nationality:
-- bits 1-4 encode the rank of the player (verified that bit 4 is part of the rank number so ranks could have gone up to 31.)
-- bits 5-6 seem to encode the citizenship as below. This part needs more testing and verification.
-----------------------------------------------------------------

function getArg6(player)
output = player:getRank();
nation = player:getNation();
if (nation == BASTOK) then
	output = output + 32;
elseif (nation == WINDURST) then
	output = output + 64;
end;
return output;
end;

-----------------------------------------------------------------
-- getCP(player) returns a player's conquest points. 
-----------------------------------------------------------------

function getCP(player)
return player:getVar("CP");
end;

-----------------------------------------------------------------
-- add_CP(player, amount) adds to a player's conquest points.
-----------------------------------------------------------------

function add_CP(player, amount)
cp = player:getVar("CP");
cp = cp + amount;
player:setVar("CP",cp);
end;

-----------------------------------------------------------------
-- giltosetHP(player) returns the amount of gil it costs a player to set a homepoint at a foreign outpost/border guard.
-----------------------------------------------------------------

function giltosetHP(guardnation, player)
rank = player:getRank();
if (getArg1(guardnation, player) < 0x700) then -- determine if player is in same or allied nation as guard 
	HPgil = 0;
else
	if (rank <= 5) then
		HPgil = 100*2^(rank-1);
	else
		HPgil = 800*rank - 2400
	end;
end;
return HPgil;
end;

-----------------------------------------------------------------
-- function hasOutpost(player, region) returns 1 if the player has the outpost of the indicated region under current allegiance.

function hasOutpost(player, region)
nation = player:getNation()
if (nation == BASTOK) then
	supply_quests = player:getVar("SUPPLY_QUESTS_BAS");
elseif (nation == SANDORIA) then
	supply_quests = player:getVar("SUPPLY_QUESTS_SAN");
elseif (nation == WINDURST) then
	supply_quests = player:getVar("SUPPLY_QUESTS_WIN");
end;
bit = {}
for i = 23,5,-1 do 
	twop = 2^i
	if (supply_quests >= twop) then
		bit[i]=1;
		supply_quests = supply_quests - twop;
	else
		bit[i]=0;
	end;
end;
return bit[region];
end;

--- Supplies key items, indexed by region number ----------------------------------------

supplies = {}

supplies[5] = 0x4B; -- Ronfaure supplies
supplies[6] = 0x4C; -- Zulkheim supplies
supplies[7] = 0x4D; -- Norvallen supplies
supplies[8] = 0x4E; -- Gustaberg supplies
supplies[9] = 0x4F; -- Derfland supplies
supplies[10] = 0x50; -- Sarutabaruta supplies
supplies[11] = 0x51; -- Kolshushu supplies
supplies[12] = 0x52; -- Aragoneu supplies
supplies[13] = 0x53; -- Fauregandi supplies
supplies[14] = 0x54; -- Valdeaunia supplies
supplies[15] = 0x7C; -- Qufim supplies
supplies[16] = 0x55; -- Li'Telor supplies
supplies[17] = 0x56; -- Kuzotz supplies
supplies[18] = 0x57; -- Vollbow supplies
supplies[19] = 0x106; -- Elshimo Lowlands supplies
supplies[20] = 0x107; -- Elshimo Uplands supplies
supplies[21] = 0x26C; -- Tavnazian Archipelago supplies

------- supply quest rewards, in conquest points, by region
-- see http://wiki.ffxiclopedia.org/wiki/Talk:Supply_Run_Mission
-- I filled in the blanks with reasonable guesses.
-- * means unverified.

supply_quest_reward = {}

supply_quest_reward[RONFAURE] = 10
supply_quest_reward[ZULKHEIM] = 30
supply_quest_reward[NORVALLEN] = 40 --*
supply_quest_reward[GUSTABERG] = 10
supply_quest_reward[DERFLAND] = 40 --*
supply_quest_reward[SARUBATARUTA] = 10
supply_quest_reward[KOLSHUSHU] = 40 --*
supply_quest_reward[ARAGONEU] = 40 --*
supply_quest_reward[FAUREGANDI] = 70
supply_quest_reward[VALDEAUNIA] = 50 -- this one seems a little fishy
supply_quest_reward[QUFIMISLAND] = 60
supply_quest_reward[LITELOR] = 40 --*
supply_quest_reward[KUZOTZ] = 70
supply_quest_reward[VOLLBOW] = 70
supply_quest_reward[ELSHIMOLOWLANDS] = 70 -- *
supply_quest_reward[ELSHIMOUPLANDS ] = 70
supply_quest_reward[TULIA ] = 70 -- *
supply_quest_reward[TAVNAZIA] = 70

-------------------------------------------------------------------------
-- function supplies_fresh(player) returns 1 if the supplies have been delivered in time, 0 otherwise. This function is not final and will
-- have to be corrected once the core supports conquest.
-------------------------------------------------------------------------

function supplies_fresh(player)
	delivery_time = os.time()-player:getVar("supply_quest_started");
	if (delivery_time <= 3600) then
		output = 1;
	else
		output = 0;
	end;
	return output;
end;

item_price = { 1000, 2000, 4000, 8000, 16000, 24000, 32000, 40000, 48000, 56000 }

-------------------------------------------------------------------------
-- function getItemPrice(guardnation, player, number) returns the price of conquest item #number from the guard nation for the player, in CP.
-------------------------------------------------------------------------
function getItemPrice(guardnation, player, number)
rank = 0;
if (number == 32928) then
	p = 500;
elseif (number == 32929) then
	p = 750;
elseif (number == 32930) then
	p = 2500;
elseif (number == 32931) then
	p = 9000;
elseif (number == 32932) then
	p = 5000;
elseif (number == 32933) then
	p = 500;
elseif (number == 32934) then
	p = 1000;
elseif (number == 32935) then
	p = 2000;
elseif (number >= 32768) and (number <= 32783) then
	rank = 1;
elseif (number >= 32784) and (number <= 32799) then
	rank = 2;
elseif (number >= 32800) and (number <= 32815) then
	rank = 3;
elseif (number >= 32816) and (number <= 32831) then
	rank = 4;
elseif (number >= 32832) and (number <= 32847) then
	rank = 5;
elseif (number >= 32848) and (number <= 32863) then
	rank = 6;
elseif (number >= 32864) and (number <= 32879) then
	rank = 7;
elseif (number >= 32880) and (number <= 32895) then
	rank = 8;
elseif (number >= 32896) and (number <= 32911) then
	rank = 9;
elseif (number >= 32912) and (number <= 32927) then
	rank = 10;
end;
if (rank > 0) then
	if (guardnation ~= player:getNation()) then
		rank = rank + 1; -- effective item rank is 1 higher for foreigners.
	end;
	p = item_price[rank];
end;
return p;
end;

-- creates the usual OP vendor store; code by Arcanedemon. ----------------------------------

function createOPVendorShop(player)
	shop = player:createShop(9);
	stock = {0x1034,316, 0x1037,800, 0x1020,4832, 0x1036,2595, 0x1010,910};
	i = 1;
	while i <= (table.getn(stock)-1) do
		shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
		i = i+2;
		if (i >= table.getn(stock)) then 
			break; 
		end
	end
	player:sendShop(shop);
end;

----- price to teleport from OP back home; 0 indicates teleport not available. --------------------------

-- baseline fees are indexed by region number; for example, RONFAURE = 5, so the 5th number in the list is the price to teleport
-- to Ronfaure. Fees are trippled when the region is no longer under the player's nation's control.

fees = { 0, 0, 0, 0, 100, 100, 150, 100, 150, 100, 100, 150, 350, 400, 150, 250, 300, 500, 250, 350, 500, 0, 300 }

function OP_TeleFee(player, region)
if (hasOutpost(player, region)) then
	if (region_control[region] == player:getNation()) then
		fee = fees[region];
	else
		fee = fees[region]*3;
	end;
else
	fee = 0;
end;	
return fee;
end;
	
---- outpost Teleports ------------------------------------------------------

function toOutpost(player, region)
	if (region == RONFAURE) then
		player:setPos(-446, -20 , -220, 0, 0x64); 
	elseif (region == ZULKHEIM) then
		player:setPos(143, -7 , 100, 0, 0x67); 
	elseif (region == NORVALLEN) then
		player:setPos(57, 0 , -10, 192, 0x68); 
	elseif (region == GUSTABERG) then
		player:setPos(582, 41 , -57, 220, 0x6A); 
	elseif (region == DERFLAND) then
		player:setPos(468, 24 , 421, 192, 0x6D); 
	elseif (region == SARUBATARUTA) then
		player:setPos(-15, -13 , 318, 128, 0x73); 
	elseif (region == KOLSHUSHU) then
		player:setPos(-480, -32 , 50, 192, 0x76); 
	elseif (region == ARAGONEU) then
		player:setPos(-298, 17 , 418, 98, 0x77); 
	elseif (region == FAUREGANDI) then
		player:setPos(-20, -59, -117, 0, 0x6f);
	elseif (region == VALDEAUNIA) then
		player:setPos(210, -24, -206, 0, 0x70);
	elseif (region == QUFIMISLAND) then
		player:setPos(-246, -20 , 301, 192, 0x7E); 
	elseif (region == LITELOR) then
		player:setPos(-39, 0, -146, 0, 0x79); 
	elseif (region == KUZOTZ) then
		player:setPos(-257, 8, -252, 0, 0x72); 
	elseif (region == VOLLBOW) then
		player:setPos(-184, 8, -66, 0, 0x71); 
	elseif (region == ELSHIMOLOWLANDS) then
		player:setPos(-243, 0, -400, 192, 0x7b); 
	elseif (region == ELSHIMOUPLANDS) then
		player:setPos(203, 0, -82, 36, 0x7c); 
	elseif (region == TULIA) then
		player:setPos(4, -54, -600, 192, 0x82); 
	elseif (region == TAVNAZIA) then
		player:setPos(-538, -6, -55, 116, 0x18); 
	end;
end;

function toHomeNation(player)
	if (player:getNation()==BASTOK) then
		player:setPos(89, 0 , -66, 0, 0xEA); 
	elseif (player:getNation()==SANDORIA) then
		player:setPos(49, -1 , 29, 164, 0xE7); 
	else 
		player:setPos(193, -12 , 220, 64, 0xF0); 
	end;
end;

---------------------------------------------------
-- perform_conquest_trades(player, npc, trade, CONQUEST) 
-- by ReaperX
-- performs conquest guard trades: crystals for rank points. To be added: recharges exp bands
-- guard nation is passed separately so it can be set to the player's nation for Jeuno guards.
---------------------------------------------------

function perform_conquest_trades(player, npc, guardnation, trade, CONQUEST)
require("scripts/globals/rankpoints");
if (player:getNation() == guardnation) then
	weighted_sum = traded_crystals(trade,1);
	if (weighted_sum > 0) then -- player traded crystals and only crystals
		if (player:getRank() >=2) then -- can only trade crystals if rank at least 2.
			if (player:getRankPoints() >= 4095) then
				player:showText(npc,CONQUEST+43);
			else 
				trade:isComplete();
				rank_points = add_crystals_to_rank_points(player, weighted_sum)
				if (player:getRankPoints() >= 4095) then
					player:showText(npc,CONQUEST+44); -- rank points are full now
				else
					player:showText(npc,CONQUEST+45);
				end;
			end;
		end;
	end
else
	player:showText(npc,CONQUEST - 8); -- "I cannot help you. You should go find a guard from your own country."
end;
end;

	
---- conquest point items indexed by event option -----------------------------------------

san_cp_item = {} 
bas_cp_item = {}
win_cp_item = {}

-- common San d'Oria Conquest Items

san_cp_item[32928] = 0x1056 -- scroll of Instant Reraise
san_cp_item[32929] = 0x1055 -- scroll of Instant Warp
san_cp_item[32930] = 0x3CB6 -- return ring
san_cp_item[32931] = 0x3CB5 -- homing ring
san_cp_item[32932] = 0x44AF -- Kingdom Signet staff
san_cp_item[32933] = 0x3D91 -- Chariot Band
san_cp_item[32934] = 0x3D92 -- Empress Band
san_cp_item[32935] = 0x3D93 -- Emperor band

-- Rank 1 San d'Oria Conquest Items

san_cp_item[32768] = 0x430F -- Royal Archer's longbow
san_cp_item[32769] = 0x40A0 -- Royal Archer's sword
san_cp_item[32770] = 0x30DE -- Royal Footman's bandana
san_cp_item[32772] = 0x32CC -- Royal Footman's boots
san_cp_item[32773] = 0x4133 -- Royal Archer's cesti
san_cp_item[32774] = 0x3596 -- Royal Footman's tunic

-- Rank 2 San d'Oria Conquest Items

san_cp_item[32784] = 0x41D4 -- Royal Spearman's spear
san_cp_item[32785] = 0x3156 -- Royal Footman's vest
san_cp_item[32786] = 0x3252 -- Royal Footman's trousers
san_cp_item[32787] = 0x43D7 -- Royal Spearman's horn
san_cp_item[32788] = 0x32F5 -- Royal Footman's clogs

-- Rank 3 San d'Oria Conquest Items

san_cp_item[32800] = 0x41CC -- Royal Squire's halberd
san_cp_item[32801] = 0x3330 -- Royal Squire's collar
san_cp_item[32802] = 0x308F -- Royal Squire's helm
san_cp_item[32803] = 0x318F -- Royal Squire's mufflers
san_cp_item[32804] = 0x328F -- Royal Squire's sollerets
san_cp_item[32805] = 0x4168 -- Royal Squire's dagger
san_cp_item[32806] = 0x42FE -- Royal Squire's mace
san_cp_item[32807] = 0x34B7 -- San d'Orian ring

-- Rank 4 San d'Oria Conquest Items  
                 
san_cp_item[32816] = 0x40D9 -- Royal Swordsman's blade
san_cp_item[32817] = 0x310F -- Royal Squire's chainmail
san_cp_item[32818] = 0x320F -- Royal Squire's breeches
san_cp_item[32819] = 0x3597 -- Royal Squire's robe
san_cp_item[32820] = 0x3030 -- Royal Squire's shield

-- Rank 5 San d'Oria Conquest Items

san_cp_item[32832] = 0x41D3 -- Royal Knight Army lance
san_cp_item[32833] = 0x40BB -- Temple Knight Army sword
san_cp_item[32834] = 0x3018 -- Royal Knight Army shield
san_cp_item[32835] = 0x3019 -- Temple Knight Army shield
san_cp_item[32836] = 0x3333 -- Royal Knight Army collar
san_cp_item[32837] = 0x3331 -- Temple Knight Army collar
san_cp_item[32838] = 0x318E -- Royal Knight's mufflers
san_cp_item[32839] = 0x328E -- Royal Knight's sollerets
san_cp_item[32840] = 0x33A4 -- Royal Knight's belt
san_cp_item[32841] = 0x3598 -- Royal Knight's cloak

-- Rank 6 San d'Oria Conquest Items

san_cp_item[32848] = 0x350C -- Royal Army mantle
san_cp_item[32849] = 0x3332 -- Royal Guard's collar
san_cp_item[32850] = 0x308E -- Royal Knight's bascinet
san_cp_item[32851] = 0x359A -- Royal Knight's aketon
san_cp_item[32852] = 0x310E -- Royal Knight's chainmail
san_cp_item[32853] = 0x320E -- Royal Knight's breeches
san_cp_item[32854] = 0x3021 -- Royal Guard's shield
san_cp_item[32855] = 0x42AB -- Royal Guard's rod
san_cp_item[32856] = 0x40D7 -- Royal Guard's sword
san_cp_item[32857] = 0x41A5 -- Royal Guard's fleuret

-- Rank 7 San d'Oria Conquest Items

san_cp_item[32864] = 0x43AF -- Grand Knight's arrow
san_cp_item[32865] = 0x41F6 -- Grand Knight's lance
san_cp_item[32866] = 0x34F5 -- Grand Knight's ring

-- Rank 8 San d'Oria Conquest Items

san_cp_item[32880] = 0x36BD -- Grand Temple Knight's gauntlets
san_cp_item[32881] = 0x36BE -- Grand Temple Knight's bangles
san_cp_item[32882] = 0x3354 -- Grand Temple Knight's collar

-- Rank 9 San d'Oria Conquest Items

san_cp_item[32896] = 0x4239 -- Reserve Captain's greatsword
san_cp_item[32897] = 0x460E -- Reserve Captain's pick
san_cp_item[32898] = 0x4432 -- Reserve Captain's mace
san_cp_item[32899] = 0x41FD -- Reserve Captain's lance

-- Rank 10 San d'Oria Conquest Items
san_cp_item[32912] = 0x385C -- Kingdom aketon

-- common Bastok Conquest Items

bas_cp_item[32928] = 0x1056 -- scroll of Instant Reraise
bas_cp_item[32929] = 0x1055 -- scroll of Instant Warp
bas_cp_item[32930] = 0x3CB6 -- return ring
bas_cp_item[32931] = 0x3CB5 -- homing ring
bas_cp_item[32932] = 0x44B0 -- Republic Signet staff
bas_cp_item[32933] = 0x3D91 -- Chariot Band
bas_cp_item[32934] = 0x3D92 -- Empress Band
bas_cp_item[32935] = 0x3D93 -- Emperor band

-- Rank 1 Bastok Conquest Items

bas_cp_item[32768] = 0x4031 -- Legionnaire's knuckles
bas_cp_item[32769] = 0x4347 -- Legionnaire's crossbow
bas_cp_item[32770] = 0x4108 -- Legionnaire's axe
bas_cp_item[32771] = 0x30DD -- Legionnaire's cap
bas_cp_item[32772] = 0x31D0 -- Legionnaire's mittens
bas_cp_item[32773] = 0x32CB -- Legionnaire's leggings
bas_cp_item[32774] = 0x42E8 -- Legionnaire's staff
bas_cp_item[32775] = 0x418C -- Legionnaire's scythe

-- Rank 2 Bastok Conquest Items

bas_cp_item[32784] = 0x4298 -- Decurion's hammer
bas_cp_item[32785] = 0x3155 -- Legionnaire's harness
bas_cp_item[32786] = 0x3251 -- Legionnaire's subligar
bas_cp_item[32787] = 0x4169 -- Decurion's dagger
bas_cp_item[32788] = 0x3031 -- Decurion's shield

-- Rank 3 Bastok Conquest Items

bas_cp_item[32800] = 0x4148 -- Centurion's axe
bas_cp_item[32801] = 0x332A -- Republican Bronze Medal
bas_cp_item[32802] = 0x3096 -- Centurion's visor
bas_cp_item[32803] = 0x3116 -- Centurion's scale mail
bas_cp_item[32804] = 0x3196 -- Centurion's finger gauntlets
bas_cp_item[32805] = 0x3216 -- Centurion's cuisses
bas_cp_item[32806] = 0x3296 -- Centurion's greaves
bas_cp_item[32807] = 0x41A6 -- Centurion's sword
bas_cp_item[32808] = 0x3606 -- Legionnaire's circlet
bas_cp_item[32809] = 0x34B9 -- Bastokan ring

-- Rank 4 Bastok Conquest Items  
                 
bas_cp_item[32816] = 0x4084 -- Junior Musketeer's tuck
bas_cp_item[32817] = 0x3086 -- Iron Musketeer's armet
bas_cp_item[32818] = 0x3186 -- Iron Musketeer's gauntlets
bas_cp_item[32819] = 0x3286 -- Iron Musketeer's sabatons
bas_cp_item[32820] = 0x3599 -- Iron Musketeer's gambison
bas_cp_item[32821] = 0x4383 -- Junior Musketeer's chakram

-- Rank 5 Bastok Conquest Items

bas_cp_item[32832] = 0x4091 -- Musketeer's sword
bas_cp_item[32833] = 0x332B -- Republican Iron Medal
bas_cp_item[32834] = 0x3106 -- Iron Musketeer's cuirass
bas_cp_item[32835] = 0x3206 -- Iron Musketeer's cuisses
bas_cp_item[32836] = 0x42E9 -- Musketeer's pole
bas_cp_item[32837] = 0x4365 -- Musketeer gun

-- Rank 6 Bastok Conquest Items

bas_cp_item[32848] = 0x332C -- Republican Mythril Medal
bas_cp_item[32849] = 0x350E -- Republican Army mantle
bas_cp_item[32850] = 0x40AD -- Musketeer Commander's falchion
bas_cp_item[32851] = 0x3010 -- Musketeer Commander's shield
bas_cp_item[32852] = 0x42FF -- Musketeer Commander's rod
bas_cp_item[32853] = 0x3308 -- Iron Musketeer's gorget

-- Rank 7 Bastok Conquest Items

bas_cp_item[32864] = 0x43B0 -- Gold Musketeer's bolt
bas_cp_item[32865] = 0x458F -- Gold Musketeer's uchigatana
bas_cp_item[32866] = 0x34F6 -- Gold Musketeer's ring

-- Rank 8 Bastok Conquest Items

bas_cp_item[32880] = 0x36BF -- Praefectus's gloves
bas_cp_item[32881] = 0x3638 -- Presidential hairpin
bas_cp_item[32882] = 0x3355 -- Republican Gold Medal

-- Rank 9 Bastok Conquest Items

bas_cp_item[32896] = 0x419F -- Senior Gold Musketeer's scythe
bas_cp_item[32897] = 0x4431 -- Senior Gold Musketeer's rod
bas_cp_item[32898] = 0x4714 -- Senior Gold Musketeer's axe
bas_cp_item[32899] = 0x44F7 -- Senior Gold Musketeer's scimitar

-- Rank 10 Bastok Conquest Items
bas_cp_item[32912] = 0x385D -- Republic aketon

-- common Windurst Conquest Items

win_cp_item[32928] = 0x1056 -- scroll of Instant Reraise
win_cp_item[32929] = 0x1055 -- scroll of Instant Warp
win_cp_item[32930] = 0x3CB6 -- return ring
win_cp_item[32931] = 0x3CB5 -- homing ring
win_cp_item[32932] = 0x44B1 -- Federation Signet staff
win_cp_item[32933] = 0x3D91 -- Chariot Band
win_cp_item[32934] = 0x3D92 -- Empress Band
win_cp_item[32935] = 0x3D93 -- Emperor band

-- Rank 1 Windurst Conquest Items

win_cp_item[32768] = 0x4307 -- Freesword's bow
win_cp_item[32769] = 0x4284 -- Freesword's club
win_cp_item[32770] = 0x403A -- Freesword's baghnakhs
win_cp_item[32771] = 0x3273 -- Freesword's slops
win_cp_item[32772] = 0x42EA -- Freesword's staff

-- Rank 2 Windurst Conquest Items

win_cp_item[32784] = 0x42CF -- Mercenary's pole
win_cp_item[32785] = 0x30C4 -- Mercenary's hachimaki
win_cp_item[32786] = 0x316D -- Mercenary's gi
win_cp_item[32787] = 0x31AF -- mercenary's tekko
win_cp_item[32788] = 0x3237 -- Mercenary's sitabaki
win_cp_item[32789] = 0x32AF -- Mercenary's kyahan
win_cp_item[32790] = 0x416A -- Mercenary's knife
win_cp_item[32791] = 0x4222 -- Mercenary's greatsword

-- Rank 3 Windurst Conquest Items

win_cp_item[32800] = 0x4188 -- Mercenary Captain's scythe
win_cp_item[32801] = 0x30B6 -- Mercenary Captain's headgear
win_cp_item[32802] = 0x3136 -- Mercenary Captain's doublet
win_cp_item[32803] = 0x31B6 -- Mercenary Captain's gloves
win_cp_item[32804] = 0x3236 -- Mercenary Captain's hose
win_cp_item[32805] = 0x32B6 -- Mercenary Captain's gaiters
win_cp_item[32806] = 0x416B -- Mercenary Captain's kukri
win_cp_item[32807] = 0x33A5 -- Mercenary Captain's belt
win_cp_item[32808] = 0x34B8 -- Windurstian ring

-- Rank 4 Windurst Conquest Items  
                 
win_cp_item[32816] = 0x404F -- Combat Caster's dagger
win_cp_item[32817] = 0x4382 -- Combat Caster's boomerang
win_cp_item[32818] = 0x332D -- green scarf
win_cp_item[32819] = 0x3146 -- Combat Caster's cloak
win_cp_item[32820] = 0x31C7 -- Combat Caster's mitts
win_cp_item[32821] = 0x3246 -- Combat Caster's slacks
win_cp_item[32822] = 0x32C6 -- Combat Caster's shoes
win_cp_item[32823] = 0x41A7 -- Combat Caster's scimitar
win_cp_item[32824] = 0x411D -- Combat Caster's axe

-- Rank 5 Windurst Conquest Items

win_cp_item[32832] = 0x42BA -- Tactician Magician's wand
win_cp_item[32833] = 0x332E -- paisley scarf
win_cp_item[32834] = 0x30BE -- Tactician Magician's hat
win_cp_item[32835] = 0x313E -- Tactician Magician's coat
win_cp_item[32836] = 0x31BE -- Tactician Magician's cuffs
win_cp_item[32837] = 0x323E -- Tactician Magician's slops
win_cp_item[32837] = 0x32BE -- Tactician Magician's pigaches
win_cp_item[32837] = 0x41AA -- Tactician Magician's espadon
win_cp_item[32837] = 0x4136 -- Tactician Magician's hooks

-- Rank 6 Windurst Conquest Items

win_cp_item[32848] = 0x332F -- Checkered scarf
win_cp_item[32849] = 0x350D -- Federal Army mantle
win_cp_item[32850] = 0x42C6 -- Wise Wizard's staff
win_cp_item[32851] = 0x41A8 -- Wise Wizard's bilbo
win_cp_item[32852] = 0x41A9 -- Wise Wizard's anelace

-- Rank 7 Windurst Conquest Items

win_cp_item[32864] = 0x43B1 -- Patriarch Protector's arrow
win_cp_item[32865] = 0x304B -- Patriarch Protector's shield
win_cp_item[32866] = 0x34F7 -- Patriarch Protector's ring

-- Rank 8 Windurst Conquest Items

win_cp_item[32880] = 0x36C0 -- Master Caster's mitts
win_cp_item[32881] = 0x36C1 -- Master Caster's bracelets
win_cp_item[32882] = 0x3356 -- Windurstian scarf

-- Rank 9 Windurst Conquest Items

win_cp_item[32896] = 0x46E1 -- Master Caster's bow
win_cp_item[32897] = 0x447A -- Master Caster's pole
win_cp_item[32898] = 0x4464 -- Master Caster's baghnakhs
win_cp_item[32899] = 0x44D1 -- Master Caster's knife

-- Rank 10 Windurst Conquest Items
win_cp_item[32912] = 0x385E -- Federation aketon

-----------------------------------
--	Author: ReaperX
--  getCPItem(nation, option) returns the itemID of the item associated
--  with the option value (this is a numbering scheme used by conquest guard
--  dialogs) and the nation.
-----------------------------------

function getCPItem(nation, option)
if (nation == 0) then
	item = san_cp_item[option];
elseif (nation == 1) then
	item = bas_cp_item[option];
else
	item = win_cp_item[option];
end;
return item;
end;

