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
	player:startEvent( Event(0x65));
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
		if player:getVar("ronfaureMaw") == 0 then
			--print("East Ronfaure Maw activated")
			player:setVar("ronfaureMaw",1)
		end
		--print("Teleporting player to East Ronfaure")
		player:setPos(320,-60,500,78,0x65)
	end
end;