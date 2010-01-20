-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Moyoyo
-- 	Basic Chat Text, Windurst Mission 2-3
-----------------------------------

--[[

0x0FC Welcome.. we can't do anything for you if you don't have a letter of introduction.
0x107 Oh! You have a letter of introduction! The consul would want to see you in.
0x108 Oh! You are going to be fighting and all! Be careful!
0x109 oh! Good to see you again! Are you going back to Windurst now? Tell everyone that we're doing fine!
--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,5) == 1) and ((mission_status == 2) or (mission_status == 14)) then
	player:startEvent(Event(0x107));
elseif (player:getMissionStatus(2,5) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x108));
elseif (player:getMissionStatus(2,7) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x108));
else
	player:startEvent(Event(0xFC));
end; 
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