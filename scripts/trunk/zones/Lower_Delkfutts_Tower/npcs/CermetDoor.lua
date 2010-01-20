-----------------------------------
--	Author: ReaperX
--	Cermet door that leads to Upper Delkfutt's Tower.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
player:startEvent(Event(0x14)); -- missing walk-through animation, but it's the best I could find.
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
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
if (csid == 0x14) and (option ~=0) then
    player:setPos(313, 16, 20, 128, 0x9E);	-- to Upper Delkfutt's Tower
end;
end;