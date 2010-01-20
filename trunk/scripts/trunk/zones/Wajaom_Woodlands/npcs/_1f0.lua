-----------------------------------
--	Author: ReaperX
-- 	Postern (door _1f0)
-- 	Shortcut back into Aht Urgan Whitegate, South Harbor
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

player:startEvent(Event(0x01F6)); 
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
if (option == 1) then
  player:setPos(-39, 2 ,-56, 1,0x32);  -- put player back in AUW 
end
end;
