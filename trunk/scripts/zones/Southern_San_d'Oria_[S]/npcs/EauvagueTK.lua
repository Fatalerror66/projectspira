-----------------------------------
--	Author: Arcanedemon + Mana
-- 	EauvagueTK
-- 	Working 100% - Thanks Snotz for fixing the Event handling
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
	player:startEvent(Event(0x00C8));
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
		player:setPos(86,-62,274,25,0x51)
	end
end;