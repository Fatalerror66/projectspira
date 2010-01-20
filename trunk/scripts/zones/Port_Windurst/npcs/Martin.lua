-----------------------------------
--	Author: Tenjou
--	Martin
--	He announces the airship waiting time.  The airship comes every 864 seconds,and he has a counter based on that.
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
local event0x274 = Event(0x274);
event0x274:setParams(airline);
player:startEvent(event0x274);
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