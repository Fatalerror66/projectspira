-----------------------------------
--	Author: Tenjou
--	Baren-Moren
--	Starts and ends quest "Hat in Hand."  Right now only the 8 other NPCs which change dialogue are involved in this quest.  More NPCs may be integrated into this quest into the future.  
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
hat = player:getVar("hatInHand");
feather = player:getVar("aFeatherInOnesCap");
--Check status of quest "A Feather in One's Cap."
if (feather ~= 1) then
	if (hat == 0) then
		--quest offer
		player:startEvent(Event(0x30));
	elseif (hat == 1) then
		--quest during
		local checker = Event(0x34);
		--check each NPC: more will need to be added for each NPC
		local bondada = player:getVar("hatInHand-BondadaCS");
		local honoigomoi = player:getVar("hatInHand-HonoiGomoiCS");
		local kenapakeppa = player:getVar("hatInHand-KenapaKeppaCS");
		local clais = player:getVar("hatInHand-ClaisCS");
		local kyumeromeh = player:getVar("hatInHand-KyumeRomehCS");
		local tosukaporika = player:getVar("hatInHand-TosukaPorikaCS");
		local pechirumashiru = player:getVar("hatInHand-PechiruMashiruCS");
		local machitata = player:getVar("hatInHand-MachitataCS");
		if (bondada == 1 and honoigomoi == 1 and kenapakeppa == 1 and clais == 1 and kyumeromeh == 1 and tosukaporika == 1 and pechirumashiru == 1 and machitata == 1) then
			--THE POINT VALUES FOR EACH NPC IS AS OF NOW UNKNOWN; it seems to be that each NPC is 
			--worth 1 point,and those who change dialogue are worth 2 points.  The cutoffs are:
			--20: minimal reward (50 gil)
			--30: small reward
			--40: success,gil and hat reward
			--80: HQ success. maximum gil and the hat as well
			checker:setParams(80);
		end
		player:startEvent(checker);
	elseif (hat == 2) then
		--after failure; can also use 0x3f and 0x40
		player:startEvent(Event(0x41));
	elseif (hat == 3) then
		--after success; can also use 0x42 and 0x44
		player:startEvent(Event(0x43));
	elseif (hat == 4) then
		--repeat quest offer
		player:startEvent(Event(0x31));
	end
else
	event0x4e = Event(0x4e);
	event0x4e:setParams(0,0x34a);
	player:startEvent(event0x4e);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
feather = player:getVar("aFeatherInOnesCap");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x34a,3);
if (feather == 1 and count == 3 and item1) then
	--Quest "A Feather in One's Cap" finish.
	trade:isComplete();
	event0x4f = Event(0x4f);
	event0x4f:setParams(1500);
	player:startEvent(event0x4f);
	--Rewards
	player:setVar("aFeatherInOnesCap",2);
	player:addGil(GIL_RATE*1500);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*1500);
	player:addFame(2,WIN_FAME*40);
	player:completeQuest(2,1);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("Option:",option);
if (csid == 0x30 and option == 1 or csid == 0x31 and option == 1) then
	--Accept quest "Hat in Hand"
	player:setVar("hatInHand",1);
	player:addQuest(2,0);
elseif (csid == 0x34 and option == 5) then
	--check each NPC: more will need to be added for each NPC
	local bondada = player:getVar("hatInHand-BondadaCS");
	local honoigomoi = player:getVar("hatInHand-HonoiGomoiCS");
	local kenapakeppa = player:getVar("hatInHand-KenapaKeppaCS");
	local clais = player:getVar("hatInHand-ClaisCS");
	local kyumeromeh = player:getVar("hatInHand-KyumeRomehCS");
	local tosukaporika = player:getVar("hatInHand-TosukaPorikaCS");
	local pechirumashiru = player:getVar("hatInHand-PechiruMashiruCS");
	local machitata = player:getVar("hatInHand-MachitataCS");
	if (bondada == 1 and honoigomoi == 1 and kenapakeppa == 1 and clais == 1 and kyumeromeh == 1 and tosukaporika == 1 and pechirumashiru == 1 and machitata == 1) then
		--quest success
		player:setVar("hatInHand",3);
		player:addItem(0x30ff);
		player:addGil(GIL_RATE*120);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*120);
		player:addFame(2,WIN_FAME*15);
--print("Windurst fame adjusted for",player:getName(),"by 15 (Total:",player:getFame(2),").");
		player:completeQuest(2,0);
	else
		--quest fail
		player:setVar("hatInHand",2);
	end
	player:setVar("hatInHand-BondadaCS",0);
	player:setVar("hatInHand-HonoiGomoiCS",0);
	player:setVar("hatInHand-KenapaKeppaCS",0);
	player:setVar("hatInHand-ClaisCS",0);
	player:setVar("hatInHand-KyumeRomehCS",0);
	player:setVar("hatInHand-TosukaPorikaCS",0);
	player:setVar("hatInHand-PechiruMashiruCS",0);
	player:setVar("hatInHand-MachitataCS",0);
end
end;