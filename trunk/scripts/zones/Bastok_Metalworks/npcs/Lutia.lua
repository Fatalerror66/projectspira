-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Lutia
-- 	Basic Chat Text, Sandy Mission 2-3
-----------------------------------
-- Includes
require("scripts/globals/rankpoints");
require("scripts/globals/settings");
-----------------------------------
--[[ Lutia events

 00CA "<sigh> oh when will we be allowed to go back.."
 00D5 player has letter of introduction (2-3)
 00D6 "they gave you a job to do, I hear." (2-3)
 00D7 "oh you're back". (2-3)

--]]
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(0,5) == 1) and ((mission_status == 2) or (mission_status == 14)) then
	player:startEvent(Event(0xD5));
elseif (player:getMissionStatus(0,6) == 1) or (player:getMissionStatus(0,8) == 1) then
	player:startEvent(Event(0xD6));
elseif (player:getMissionStatus(0,6) == 1) and ((mission_status ==5) or (player:hasKeyItem(KindredCrest) == 1)) then
	player:startEvent(Event(0xD7));
else
	player:startEvent(Event(0xCA));
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
end;