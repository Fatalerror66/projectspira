-----------------------------------
--	Author: Tenjou
-- 	Fyi Chalmwoh
-- 	Starts quest "It's Raining Mannequins!"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mannequin = player:getVar("ItsRainingMannequins");
if (mannequin == 0) then
	player:startEvent(Event(0x131));
	player:setVar("ItsRainingMannequins",1);
else
	player:startEvent(Event(0x132));
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
end;