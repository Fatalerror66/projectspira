-----------------------------------
--	Author: Tenjou
-- 	Bondada
-- 	Involved in quest "Hat in Hand."  She normally won't change dialogue until you have talked to 10 other NPCs who don't change dialogue.  In this case she will change dialogue after players talk to the other 7 needed NPCs,as others are not yet integrated into this quest.
--	Also starts quest "A Feather in One's Cap."  It should be repeatable, but right now it isn't.
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
hat = player:getVar("hatInHand");
hatcomplete = player:getQuestStatus(2,0);
feather = player:getVar("aFeatherInOnesCap");
famelevel = player:getFameLevel(2);
if (famelevel >= 3 and hat ~= 1 and feather ~= 2 and hatcomplete == 2) then
	--Check status of quest "A Feather in One's Cap."
	if (feather == 0) then
		event0x4b = Event(0x4b);
		event0x4b:setParams(0,0x34a);
		player:startEvent(event0x4b);
	elseif (feather == 1) then
		player:startEvent(Event(0x49));
	end
else
	--Check status of quest "Hat in Hand."
	local bondada = player:getVar("hatInHand-BondadaCS");
	local honoigomoi = player:getVar("hatInHand-HonoiGomoiCS");
	local kenapakeppa = player:getVar("hatInHand-KenapaKeppaCS");
	local clais = player:getVar("hatInHand-ClaisCS");
	local kyumeromeh = player:getVar("hatInHand-KyumeRomehCS");
	local tosukaporika = player:getVar("hatInHand-TosukaPorikaCS");
	local pechirumashiru = player:getVar("hatInHand-PechiruMashiruCS");
	local machitata = player:getVar("hatInHand-MachitataCS");
	if (hat == 1) then
		if (honoigomoi == 1 and kenapakeppa == 1 and clais == 1 and kyumeromeh == 1 and tosukaporika == 1 and pechirumashiru == 1 and machitata == 1) then
			if (bondada == 0) then
				--NEEDS A PACKET 2A
				player:startEvent(Event(0x3d));
				player:setVar("hatInHand-BondadaCS",1);
			elseif (bondada == 1) then
				player:startEvent(Event(0x3e));
			end
		else
			player:startEvent(Event(0x35));
		end
	else
		player:startEvent(Event(0x2b));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x4b and option == 1) then
	--Accept quest "A Feather in One's Cap"
	player:setVar("aFeatherInOnesCap",1);
	player:addQuest(2,1);
end
end;