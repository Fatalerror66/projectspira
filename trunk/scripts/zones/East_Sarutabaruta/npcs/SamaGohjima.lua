-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Sama Gohjima
-- 	Involved in Windurst Mission 1-1.
--  despite the information at  http://wiki.ffxiclopedia.org/wiki/The_Horutoto_Ruins_Experiment ,
--  this seems like an optional event so I coded it as such. ReaperX
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");


-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--: Check if the player is on this step in the mision.--
if (player:getMissionStatus(2,0) == 1) and (player:getVar("mission_status") == 2) then
	player:startEvent(Event(0x35));
else
	player:startEvent(Event(0x2b));
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