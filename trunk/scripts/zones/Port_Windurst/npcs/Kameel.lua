-----------------------------------
--	Author: Tenjou
--	Kameel
--	He announces the airship waiting time.  The airship comes every 864 seconds, and he has a counter based on that.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local windyairtime = (os.time() - 1009810800);
local airline = windyairtime%864;
local event0xc1 = Event(0xc1);
event0xc1:setParams(airline);
player:startEvent(event0xc1);
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