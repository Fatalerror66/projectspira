-----------------------------------
--	Author: JesseJames
-- 	Ailevia
-- 	NPC Adventurer's Assistant Text Scripted
--  NPC 100% completed - 7/6/09
--  Nice work JesseJames, Mana
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	player:startEvent(Event(0x267));
end; 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
--print("onTrade")
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
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
end;