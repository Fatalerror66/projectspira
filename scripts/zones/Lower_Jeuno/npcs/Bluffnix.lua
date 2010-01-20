-----------------------------------
--	Author: Tenjou
-- 	Bluffnix
-- 	Starts and ends Gobbiebag quests.
--
--	Thanks Mana and Snotz for your helpful insight.
-----------------------------------

function gobquest(player,gobbiebag)
currquest = 0;
switch (gobbiebag) : caseof {
	[1] = function (x) currquest = 27; end, --Gobbiebag I
	[2] = function (x) currquest = 28; end, --Gobbiebag II
	[3] = function (x) currquest = 29; end, --Gobbiebag III
	[4] = function (x) currquest = 30; end, --Gobbiebag IV
	[5] = function (x) currquest = 74; end, --Gobbiebag V
	[6] = function (x) currquest = 75; end, --Gobbiebag VI
	[7] = function (x) currquest = 93; end, --Gobbiebag VII
	[8] = function (x) currquest = 94; end, --Gobbiebag VIII
	[9] = function (x) currquest = 123; end, --Gobbiebag IX
	[10] = function (x) currquest = 124; end, --Gobbiebag X
default = function (x) end, }
return currquest;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--See which quest should be offered.
gobbiebag = player:getVar("gobbiebagQuests");
if (gobbiebag == 0) then 
	player:setVar("gobbiebagQuests",1); 
	gobbiebag = 1;
end
quest = 26 + (gobbiebag*5);

--Check quest status.
currquest = gobquest(player,gobbiebag);
status = player:getQuestStatus(3,currquest);

--Check for possible offer.
offerlevel = 2 + gobbiebag;
fame = player:getFameLevel(5);
if (offerlevel > 9) then offerlevel = 9; end
if (fame >= offerlevel) then offer = 1; end

--Do it!
event0x2b = Event(0x2b);
event0x2b:setParams(quest,status,offer);
player:startEvent(event0x2b);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
gobbiebag = player:getVar("gobbiebagQuests");
currquest = gobquest(player,gobbiebag);

itemA1 = trade:hasItemQty(0848,1); --Dhalmel Leather
itemA2 = trade:hasItemQty(0652,1); --Steel Ingot
itemA3 = trade:hasItemQty(0826,1); --Linen Cloth
itemA4 = trade:hasItemQty(0788,1); --Peridot
itemB1 = trade:hasItemQty(0851,1); --Ram Leather
itemB2 = trade:hasItemQty(0653,1); --Mythril Ingot
itemB3 = trade:hasItemQty(0827,1); --Wool Cloth
itemB4 = trade:hasItemQty(0798,1); --Turquoise
itemC1 = trade:hasItemQty(0855,1); --Tiger Leather
itemC2 = trade:hasItemQty(0745,1); --Gold Ingot
itemC3 = trade:hasItemQty(0828,1); --Velvet Cloth
itemC4 = trade:hasItemQty(0797,1); --Painite
itemD1 = trade:hasItemQty(0931,1); --Cermet Chunk
itemD2 = trade:hasItemQty(0654,1); --Darksteel Ingot
itemD3 = trade:hasItemQty(0829,1); --Silk Cloth
itemD4 = trade:hasItemQty(0808,1); --Goshenite
itemE1 = trade:hasItemQty(1637,1); --Bugard Leather
itemE2 = trade:hasItemQty(1635,1); --Paktong Ingot
itemE3 = trade:hasItemQty(1636,1); --Moblinweave
itemE4 = trade:hasItemQty(1634,1); --Rhodonite
itemF1 = trade:hasItemQty(1741,1); --HQ Eft Skin
itemF2 = trade:hasItemQty(1738,1); --Shakudo Ingot
itemF3 = trade:hasItemQty(1739,1); --Balloon Cloth
itemF4 = trade:hasItemQty(1740,1); --Iolite
itemG1 = trade:hasItemQty(2530,1); --Lynx Leather
itemG2 = trade:hasItemQty(0655,1); --Adaman Ingot
itemG3 = trade:hasItemQty(0830,1); --Rainbow Cloth
itemG4 = trade:hasItemQty(0812,1); --Deathstone
itemH1 = trade:hasItemQty(2529,1); --Smilodon Leather
itemH2 = trade:hasItemQty(2536,1); --Electrum Ingot
itemH3 = trade:hasItemQty(2537,1); --Square of Cilice
itemH4 = trade:hasItemQty(0813,1); --Angelstone
itemI1 = trade:hasItemQty(2538,1); --Peiste Leather
itemI2 = trade:hasItemQty(0747,1); --Orichalcum Ingot
itemI3 = trade:hasItemQty(2704,1); --Oil-Soaked Cloth
itemI4 = trade:hasItemQty(2743,1); --Oxblood Orb
itemJ1 = trade:hasItemQty(1459,1); --Griffon Leather
itemJ2 = trade:hasItemQty(1711,1); --Molybdenum Ingot
itemJ3 = trade:hasItemQty(2705,1); --Foulard
itemJ4 = trade:hasItemQty(2744,1); --Angelskin Orb

item = {
(itemA1 and itemA2 and itemA3 and itemA4),
(itemB1 and itemB2 and itemB3 and itemB4),
(itemC1 and itemC2 and itemC3 and itemC4),
(itemD1 and itemD2 and itemD3 and itemD4),
(itemE1 and itemE2 and itemE3 and itemE4),
(itemF1 and itemF2 and itemF3 and itemF4),
(itemG1 and itemG2 and itemG3 and itemG4),
(itemH1 and itemH2 and itemH3 and itemH4),
(itemI1 and itemI2 and itemI3 and itemI4),
(itemJ1 and itemJ2 and itemJ3 and itemJ4)};

i=1;
for i=1,10 do
	if (item[i] == true) then item[i] = i; end
	i = i+1;
end

if (count == 4 and gobbiebag == item[gobbiebag]) then
	--Complete gobbiebag quests!
	trade:isComplete();
	player:completeQuest(3,currquest);
	player:setVar("gobbiebagQuests",gobbiebag+1);
	player:addFame(0,20*SAN_FAME); --Arbitrary amounts
	player:addFame(1,20*BAS_FAME);
	player:addFame(2,20*WIN_FAME);
	player:increaseStorage(0,5);
	event0x49 = Event(0x49);
	event0x49:setParams(26+(gobbiebag*5));
	player:startEvent(event0x49);
end

end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
--Accept gobbiebag quests.
gobbiebag = player:getVar("gobbiebagQuests");
currquest = gobquest(player,gobbiebag);
if (option == 0) then player:addQuest(3,currquest); end
end;