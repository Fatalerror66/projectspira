-----------------------------------
--	Author: Tenjou
-- 	Aramu-Paramu
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
if (daytime < 6 or daytime >= 20) then
	player:startEvent(Event(0x260));
elseif (daytime >= 6 and daytime < 12) then
	player:startEvent(Event(0x25e));
elseif (daytime >= 12 and daytime < 17) then
	player:startEvent(Event(0x25f));
elseif (daytime >= 17 and daytime < 20) then
	player:startEvent(Event(0x25d));
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