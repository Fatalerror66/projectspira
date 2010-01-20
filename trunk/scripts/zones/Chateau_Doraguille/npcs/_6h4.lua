-----------------------------------
--	Author: ReaperX
-- 	Door: Great Hall
-- 	Involved in Sandy Missions
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");

--[[ Events:

0046 CS for Conflict (Sandy citizens)
0047 CS for Conflict (foreign citizens)
0048 CS for Conflict (foreign citizens)
000A Chateau_TheHeirToTheLight_Pt1: (zone-in triggered) CS for Sandy 9-2 "The Heir to the Light"
0008 Chateau_TheHeirToTheLight_Pt2: 2nd CS for Sandy 9-2 "The Heir to the Light"
0009 Chateau_TheHeirToTheLight_Pt3: (Halver: final CS for Sandy 9-2 "The Heir to the Light" + Promotion to rank 10!)
004C Chateau_BreakingBarriers_Pt2: final CS for Sandy 9-1 "Breaking Barriers"
0020 Chateau_BreakingBarriers_Pt1: opening CS for Sandy 9-1 "Breaking Barriers"
0057 Chateau_LeautesLastWishes_Pt1: opening CS for Sandy 6-1 "Leaute's Last Wishes" 
003D Chateau_TheShadowLord_Pt2: final CS for Sandy 5-2 "The Shadow Lord"
0015 final CS for Sandy 6-2 "Ranperre's Final Rest" (triggered by Trion door)
0064 Chateau_Lightbringer_Pt1: opening CS for Sandy 8-2 "Lightbringer"
0219 CS for Sandy 3-3 "Appointment to Jeuno"
01FD CS for Sandy 5-1 "The Ruins of Fei'Yin"
0068 Chateau_Lightbringer_Pt2: final CS for Sandy 8-2 "Lightbringer" (rank 9)

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

npcname = npc:getName();
npcid = npc:getId();
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(0,12) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x219));
elseif (player:getMissionStatus(0,15) == 1) and (mission_status == 4) then
	player:startEvent(Event(Chateau_TheShadowLord_Pt2));	
elseif (player:getMissionStatus(0,16) == 1) and (mission_status == 2) then
	player:startEvent(Event(Chateau_LeautesLastWishes_Pt1));	
elseif (player:getMissionStatus(0,21) == 1) and (mission_status == 1) then
	player:startEvent(Event(Chateau_Lightbringer_Pt1));	
elseif (player:getMissionStatus(0,21) == 1) and (mission_status == 5) then
	player:startEvent(Event(Chateau_Lightbringer_Pt2));	
elseif (player:getMissionStatus(0,22) == 1) and (mission_status == 1) then
	player:startEvent(Event(Chateau_BreakingBarriers_Pt1));	
elseif (player:hasKeyItem(FigureOfLeviathan) == 1) and (player:hasKeyItem(FigureOfGaruda) == 1) and (player:hasKeyItem(FigureOfTitan) == 1) then
	player:startEvent(Event(Chateau_BreakingBarriers_Pt2));	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 6) then
	player:startEvent(Event(Chateau_TheHeirToTheLight_Pt2)) 	
elseif (player:getXPos() < 0) then
	player:startEvent(Event(0x201));
else
	player:startEvent(Event(0x202));
end
end
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x219) then
	player:setVar("mission_status",3);
	player:addKeyItem(LetterToTheAmbassador);
  player:specialMessage(KEYITEM_OBTAINED,LetterToTheAmbassador);  
elseif ((csid == 0x201) or (csid == 0x202)) and (player:hasKeyItem(LetterToTheAmbassador) == 1) and (DEBUG_MODE) then
	player:setPos(0, 7, -23, 63, 0xF3); -- to Ru'Lude Gardens
elseif (csid == Chateau_TheShadowLord_Pt2) then
	player:setVar("mission_status",0);
  player:completeMission(0,15);
elseif (csid == Chateau_LeautesLastWishes_Pt1) then
	player:setVar("mission_status",3);
elseif (csid == Chateau_Lightbringer_Pt1) then
	player:setVar("mission_status",2);
elseif (csid == Chateau_Lightbringer_Pt2) then
  player:removeKeyItem(CrystalDowser);
  player:completeMission(0,21);
  player:setVar("mission_status",0);
  player:addGil(GIL_RATE*80000)
  player:specialMessage(GIL_OBTAINED,GIL_RATE*80000); 
  player:rankUp()
elseif (csid == Chateau_BreakingBarriers_Pt1) then
	player:setVar("mission_status",2);
	player:setPos(89, -4, -16, 24, 0x80); -- to VoS
elseif (csid == Chateau_BreakingBarriers_Pt2) then
	add_rank_points_for_mission(player);
	player:completeMission(0,22);
	player:setVar("mission_status",0);
	player:removeKeyItem(FigureOfLeviathan);
	player:removeKeyItem(FigureOfGaruda);
	player:removeKeyItem(FigureOfTitan);
elseif (csid == Chateau_TheHeirToTheLight_Pt2) then
	player:setVar("mission_status",7);
end;
end;