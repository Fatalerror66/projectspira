-----------------------------------
--	Author: Tenjou
-- 	Jatan-Paratan
-- 	Working 100%.  Changes dialogue based on the time of day.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local daytime = getVanaHour();
--Specific times may need to be changed.  Consider using getVanaMinute();
if (daytime < 6 or daytime >= 18) then
	player:startEvent(Event(0x263));
elseif (daytime >= 6 and daytime < 18) then
	player:startEvent(Event(0x262));
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