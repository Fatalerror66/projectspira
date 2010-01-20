-----------------------------------
--	Author: ReaperX
-- 	Perfaumand (guards prince Trion's door)
-- 	Involved in Sandy quests and missions
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");
-----------------------------------
--[[ events 

020A "Prince Trion's Chamber. No Entry."
004F guard: "I have a message from prince Trion asking you to make any reports of your findings to the guard at the gatehouse."
0032 guard: "Prince Trion is preparing for the journey to KRT. He asked me to tell you to travel there and purge the area of any monsters before they arrive."
0031 guard: "Prince Trion has left a message with me: Deliver your report to the guards at the gate house."
0002 9-2 (guard: "Prince Trion has departed for Fei'yin.")
0007 guard: "Prince Trion has arrived safely and is currently awaiting your arrival in the audience chamber."
0230 "Lure of the Wildcat"

--]]
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(0,10) == 1) and (mission_status == 1)  then
	event = Event(0x229);
	event:setParams(0,RoyalKnightsDavoiReport);
	player:startEvent(event);
elseif (player:getMissionStatus(0,15) == 1) and (mission_status == 1) then
	player:startEvent(Event(Chateau_TheShadowLord_Pt1)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x4F)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 6) then
	player:startEvent(Event(Chateau_RanperresFinalRest_Pt2)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 7) then
	player:startEvent(Event(0x32)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 8) then
	player:startEvent(Event(0x31)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x2)) 	
else
	player:startEvent(Event(0x20A)) 	
end
if (player:getMissionStatus(0,10) == 1) and (mission_status == 2) and (DEBUG_MODE) then
	player:setPos(31, 0, -24, 130, 0x95);	-- to Davoi / Quemaricond 
end;
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x229) then
	player:setVar("mission_status",2);
	if (DEBUG_MODE) then
		player:setPos(105, -6, 0, 0, 0xA5); 	-- to Throne Room
	end;
elseif (csid == Chateau_TheShadowLord_Pt1) then
	player:setVar("mission_status",2);
elseif (csid == 0x32) and (DEBUG_MODE) then
	player:setPos(-22, 7, 16, 142, 0xBE); 	-- to KRT
elseif (csid == 0x31) and (DEBUG_MODE) then
  player:setPos(88, 1, -53, 32, 0xE6);	-- to Ambrotien
end;
end;