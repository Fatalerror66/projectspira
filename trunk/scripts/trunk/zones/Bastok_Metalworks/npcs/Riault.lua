-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Riault
-- 	Basic Chat Text, Sandy Mission 2-3
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
--[[ events

00C9 "present your letter of introduction or leave."
00D2 "you have a letter of introduction? Good. Please go speak with the consul."
00D3 "Good luck. I pray for the successful denouement of your mission."
00D4 "There must be many missions that still need completing in San d'Oria as well."     

--]]
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(player:getMissionStatus(0,5) == 1 and (mission_status == 2 or mission_status == 14)) then
	player:startEvent(Event(0xD2));
elseif (player:getMissionStatus(0,6) == 1 or player:getMissionStatus(0,8) == 1) then
	player:startEvent(Event(0xD3));
elseif (player:hasKeyItem(KindredReport) == 1) then
	player:startEvent(Event(0xD4));
else
	player:startEvent(Event(0xC9));
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