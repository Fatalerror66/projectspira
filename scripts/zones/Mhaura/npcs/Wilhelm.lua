-----------------------------------
--	Author: Tenjou
-- 	Wilhelm
-- 	Accepts items from Proto-Ultima and Proto-Omega for Nashira and Homam armor.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--The other events are triggered after reaching chapter 8 in Chains of Promathia.
player:startEvent(Event(0x145));
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