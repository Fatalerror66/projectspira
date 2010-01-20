-----------------------------------
--	Author: Tenjou, ReaperX
-- 	OPTISTERY MINISTER: Tosuka-Porika
-- 	Involved in quest "Hat in Hand."
--  CoP Mission 3-3B3 "Exit Stage Left"
--  Windurst Mission 2-1 "Lost for Words"
--  Windurst Mission 7-1 "The Sixth Ministry"
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

--[[ events 

0172
017B
017C
00A0 Windurst Mission 2-1
00A1 Windurst Mission 2-1
00A8 Windurst Mission 2-1
00A9 Windurst Mission 2-1
0183 opening CS for "Early Bird Catches the Bookworm"
0184
0192 
0037 Hat in Hand CS
0193 opening CS for "Chasing Tales"
0196 
019C
031C 
02CB opening CS for Windurst 7-1 "The Sixth Ministry"
02CC repeats instructions for 7-1
02D4 final CS for 7-1
02D5 after finishing 7-1
0321 CS for 8-2
0322
0323
0349
036B CoP mission 
0371 CoP mission 
038B
038C

--]]


-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local hat = player:getVar("hatInHand");
local tosukaporika = player:getVar("hatInHand-TosukaPorikaCS");

cop_status = player:getMissionStatus(6,21);
comedy_of_errors_status = player:getVar("ComedyofErrors");
mission_status = player:getVar("mission_status") 

if (hat == 1 and tosukaporika == 0) then
	--NEEDS A PACKET 2A
	player:startEvent(Event(0x37));
	player:setVar("hatInHand-TosukaPorikaCS",1);
elseif (player:getMissionStatus(2,3) == 1) and (mission_status == 1) then
	player:startEvent(Event(0xA0));
elseif (player:getMissionStatus(2,3) == 1) and (mission_status == 2) then
	player:startEvent(Event(0xA1));
elseif (player:getMissionStatus(2,3) == 1) and (mission_status == 5) then
	player:startEvent(Event(0xA8));
elseif (player:getMissionStatus(2,3) == 2) and (player:getMissionStatus(2,4) == 0) then
	player:startEvent(Event(0xA9));
elseif (player:getMissionStatus(2,18) == 1) and (mission_status == 1) then
	event = Event(0x2CB);
	event:setParams(0,OptisteryRing);
	player:startEvent(event);
elseif (player:getMissionStatus(2,18) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x2CC));
elseif (player:getMissionStatus(2,18) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x2D4));
elseif (player:getMissionStatus(2,18) == 2) and (player:getMissionStatus(2,19) == 0) then
	player:startEvent(Event(0x2D5));
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 2) and (player:hasKeyItem(OptisteryRing) == 0) then
	event = Event(0x321);
	event:setParams(0,OptisteryRing);
	player:startEvent(event);
elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 2) and (player:hasKeyItem(OptisteryRing) == 1) then
  event = Event(0x322);
	event:setParams(0,OptisteryRing);
	player:startEvent(event);
elseif (cop_status == 1) and (comedy_of_errors_status == 8) then
  player:startEvent(Event(0x36B));
elseif (cop_status == 1) and (comedy_of_errors_status == 9) then
  player:startEvent(Event(0x371));
else
	player:startEvent(Event(0x172));
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
if (csid == 0x036B) then
  player:setVar("ComedyofErrors",9);  -- final stop : Yoran-Oran
elseif (csid == 0xA0) then
	player:setVar("mission_status",2)
elseif (csid == 0xA1) and DEBUG_MODE then
	toCatBurglar(player);
elseif (csid == 0xA8) then
	player:setVar("mission_status",0)
	player:completeMission(2,3);
elseif (csid == 0xA9) and DEBUG_MODE then
	toWindurstMissionOverseer(player)
elseif (csid == 0x2CB) then
	player:setVar("mission_status",2)
	player:addKeyItem(OptisteryRing);
	player:specialMessage(KEYITEM_OBTAINED,OptisteryRing);
elseif (csid == 0x2CC) and (DEBUG_MODE) then
	toAnimastery(player);
elseif (csid == 0x2D4) then
	player:addKeyItem(BlankBookOfTheGods);
	player:specialMessage(KEYITEM_OBTAINED,BlankBookOfTheGods);
	player:removeKeyItem(OptisteryRing);
	player:setVar("mission_status",0)
	add_rank_points_for_mission(player)
	player:completeMission(2,18);
elseif (csid == 0x2D5) and (DEBUG_MODE) then
	toWindurstMissionOverseer(player);
elseif (csid == 0x321) then
	player:addKeyItem(OptisteryRing);
	player:specialMessage(KEYITEM_OBTAINED,OptisteryRing);
elseif (csid == 0x322) and (DEBUG_MODE) then
	player:setPos(185, -3, -116, 20, 0x95); -- to Sedal-Godjal in Davoi
end
end;