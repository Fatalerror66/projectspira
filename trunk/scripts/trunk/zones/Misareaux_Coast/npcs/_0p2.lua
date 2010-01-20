-----------------------------------
--	Author: ReaperX
--  Dilapidated Gate (F-7)
--  leads player back to Cape Riverne, triggers CoP cutscenes.
--  no CoP checks implemented, just "pass through the gate" menu
--  for now, the same way a player with CoP complete gets it.

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)
player:startEvent(Event(0x228));
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

