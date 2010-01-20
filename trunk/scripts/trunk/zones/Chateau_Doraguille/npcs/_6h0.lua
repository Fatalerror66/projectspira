-----------------------------------
--	Author: ReaperX
-- 	Door:Prince Royal's Rm (Trion's door) 
-- 	Involved in Sandy quests and missions
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");
-----------------------------------
--[[ Door:Prince Royal's Rm (Trion's door) Events 

0073 talks about the beastmen trying to raise the Shadow Lord
0223 Chateau_TheShadowLord_Pt1: orders you to kill the Shadow Lord (5-2)
0051 Chateau_RanperresFinalRest_Pt1: CS for 6-2 "Ranperre's Final Rest"
0050 repeats instructions for 6-2
0015 Chateau_RanperresFinalRest_Pt2: CS for Sandy 6-2 "Ranperre's Final Rest" (triggered by Trion door)
0040 Chateau_ComingOfAge_Trion: talks about finding a gift for his sister (8-1)
003F Chateau_Lightbringer_Trion: talks about Lightbringer and the rites of succession (8-2)
0003 Chateau_TheHeirToTheLight_Trion: 9-2 "you have my gratitude for saving my life in the Qu'Bia Arena"
003E after getting rank 10: thanks you for your bravery in the Northlands, offers his friendship.
0217 player goes through door
0058 final CS for "A Boy's Dream" (PLD AF2 quest)
005A opening CS for "Under Oath" (PLD AF3 quest) 
005B gives a hint for "Under Oath"
0059 final CS for "Under Oath" (PLD AF3 quest) 
004F guard: "I have a message from prince Trion asking you to make any reports of your findings to the guard at the gatehouse."
0032 guard: "Prince Trion is preparing for the journey to KRT. He asked me to tell you to travel there and purge the area of any monsters before they arrive."
0031 guard: "Prince Trion has left a message with me: Deliver your report to the guards at the gate house."
0002 9-2 (guard: "Prince Trion has departed for Fei'yin.")
0007 guard: "Prince Trion has arrived safely and is currently awaiting your arrival in the audience chamber."
0229 opening CS for mission 3-1 "Infiltrate Davoi"
022A closing CS for mission 3-1 "Infiltrate Davoi"

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
elseif (player:getMissionStatus(0,15) == 2) and (player:getMissionStatus(0,16) == 0) then
	--player:startEvent(Event(0x15)) -- this is the wrong event
elseif (player:getMissionStatus(0,10) == 1) and (mission_status == 4) then
	event = Event(0x22A);
	event:setParams(0,RoyalKnightsDavoiReport);
	player:startEvent(event);
elseif (player:getMissionStatus(0,15) == 1) and (mission_status == 1) then
	player:startEvent(Event(Chateau_TheShadowLord_Pt1)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 1) then
	player:startEvent(Event(Chateau_RanperresFinalRest_Pt1)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x50)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x4F)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 6) then
	player:startEvent(Event(Chateau_RanperresFinalRest_Pt2)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 7) then
	player:startEvent(Event(0x32)) 
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 8) then
	player:startEvent(Event(0x31)) 	
elseif (player:getVar("may_watch_coming_of_age_trion") == 1) then
	player:startEvent(Event(Chateau_ComingOfAge_Trion)) 	
elseif ((player:getMissionStatus(0,21) == 1) and (mission_status == 5)) or ((player:getMissionStatus(0,21) == 2) and (player:getMissionStatus(0,22) == 0)) then
  player:startEvent(Event(Chateau_Lightbringer_Trion));	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x2)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x7)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 7) then
	player:startEvent(Event(0x3)) 	
elseif (player:getVar("may_watch_final_trion_cs") == 1) then
	player:startEvent(Event(Chateau_TheHeirToTheLight_Trion)) 	
else
	player:specialMessage(970); -- "Prince Trion's chambers. No entry."
end
if (player:getMissionStatus(0,10) == 1) and (mission_status == 2) and (DEBUG_MODE) then
	player:setPos(31, 0, -24, 130, 0x95);	-- to Davoi / Quemaricond 
end;
end 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x229) then
	player:setVar("mission_status",2);
elseif (csid == 0x22A) then
	add_rank_points_for_mission(player)
	player:removeKeyItem(RoyalKnightsDavoiReport);
	player:completeMission(0,10);
	player:setVar("mission_status",0);
elseif (csid == Chateau_TheShadowLord_Pt1) then
	player:setVar("mission_status",2);
	if (DEBUG_MODE) then
		player:setPos(105, -6, 0, 0, 0xA5); 	-- to Throne Room
	end;
elseif (csid == Chateau_RanperresFinalRest_Pt1) then
	player:setVar("mission_status",2);
elseif (csid  == 0x50) and (DEBUG_MODE) then
	player:setPos(-22, 7, 16, 142, 0xBE); 	-- to KRT
elseif (csid == Chateau_RanperresFinalRest_Pt2) then
	player:setVar("mission_status",7);
elseif (csid == 0x32) and (DEBUG_MODE) then
	player:setPos(-22, 7, 16, 142, 0xBE); 	-- to KRT
elseif (csid == 0x31) and (DEBUG_MODE) then
  player:setPos(88, 1, -53, 32, 0xE6);	-- to Ambrotien
elseif (csid == Chateau_ComingOfAge_Trion) then
	player:setVar("may_watch_coming_of_age_trion",0);
elseif (csid == 0x3E) then
	player:setVar("may_watch_final_trion_cs",0);
end
end;