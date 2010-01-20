-----------------------------------
--	Author: Tenjou
--	Pygmalion
--	Starts and ends quest "A Discerning Eye."  Unable to implement at this time.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x802723 = Event(0x802723);

--- 4th Param (0x03) does rotation
event0x802723:setParams(0x0D44F33F,0x0D44F066,0,0x03,0,0,0,0); 

player:startEvent(event0x802723);
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