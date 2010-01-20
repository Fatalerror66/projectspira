-----------------------------------
--	Author: Mana
-- 	Cavernous Maws
-- 	Working 100%
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	npcname = npc:getName();
	npcid = npc:getId();
	--print("Name:",npcname);
	--print("NPC ID:",npcid);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Key Item Pure White Feather = hex ID 0x38E
	if player:hasKeyItem(0x38e) == 1 then
		if player:getVar("ronfaureMaw") == 1 then
			local event0x388 = Event(0x388)
			event0x388:setParams();
			player:startEvent( event0x388);
		else
			--print("You must access this Maw Through East Ronfaure [S] first")
			player:specialMessage(865,1,2,3)
		end
	else
		--print("You do not have the key item Pure White Feather")
		player:specialMessage(865,1,2,3)
	end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	
end; 
 
 -----------------------------------
--onEventSelection Action--
-----------------------------------
function onEventSelection(player,csid,option)
	--print("onEventSelection")
	--print("CSID:",csid);
	--print("RESULT:",option);
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	--print("onEventFinish")
	--print("CSID:",csid);
	--print("RESULT:",option);
	if option == 1 then
		--print("Teleporting player to East Ronfaure [s]")
		player:setPos(320,-60,500,79,0x51)
	end

end;