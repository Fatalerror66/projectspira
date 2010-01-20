-----------------------------------
--	Author: atkb
-- 	Elevator Button
-- 	Enter Jeuno Residential Areas
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x004b));
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
job = player:getMainJob();
switch(csid) : caseof {
---------------------------------
[0x004b] = function (x)
---------------------------------
if (option == 0) then
  player:setPos(0.000,-0.010,0.000,192,0xd7);
else
end
 end,
---------------------------------
default = function (x) end,}
---------------------------------
--print("CSID:",csid);
--print("RESULT:",option);
end;