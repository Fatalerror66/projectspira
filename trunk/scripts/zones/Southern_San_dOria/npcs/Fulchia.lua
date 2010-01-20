-----------------------------------
--	Author: JesseJames
-- 	Fulchia
-- 	Mog house explanation scripted, Rent a room and move-back excluded
--      
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)




check = player:getVar("fcs");
if (check == 0) then
player:startEvent(Event(0x249));
player:setVar("fcs",1);
elseif (check == 1) then
player:startEvent(Event(0x24B));
end
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
end

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 -- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;