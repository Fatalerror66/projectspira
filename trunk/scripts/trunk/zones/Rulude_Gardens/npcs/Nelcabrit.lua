-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Nelcabrit
-- 	Basic Chat Text, Sandy Mission 3-3 "Appointment to Jeuno"
--  questionable behavior: mission "The Ruins of Fei'Yin " appears in the log immediately after viewing 0x24.
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
require("scripts/zones/Rulude_Gardens/TextIDs");
-----------------------------------
--[[ Events :

66: Welcome to the Embassy (for citizens)
2E: Tells Bastokans to go outside to the right.
2F: Tells Windurstians to go outside to the other side.
2A: CS for 3.3 "Appointment to Jeuno"
43: instructions to go to Delkfuts tower.
2D: "her excellency requires help in an important matter.Proceed, and listen well."
8C: after return from Delkfutts Tower
31: for the time being, apply your efforts to our righteous conquest of the regions adjacent to Jeuno.
30: Well met, {player name}.Her excellency requires your service. Once you have completed your current mission, return and seek an audience with her.
82: opening CS for 4.1 "Magicite" (Sandy)
85: our prayers are with you. Now, make haste to the Archdukal palace!
88: How fares the archduke? He wants you to gather Magicite?
24: rank 5 CS
38: reminds you to rush back to Sandy by airship.
6A: "I'm relieved there was no danger. For now, obey the court's commands."
--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status =  player:getVar("mission_status");

if (player:getMissionStatus(0,12) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x2A));
elseif (player:getMissionStatus(0,12) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x43));
elseif (player:getMissionStatus(0,12) == 1) and (mission_status == 5) then
	player:startEvent(Event(0x8C));
elseif (player:getNation() == 2) then
	player:startEvent(Event(0x2F));
elseif (player:getNation() == 1) then
	player:startEvent(Event(0x2E));
elseif (player:hasKeyItem(ArchducalAudiencePermit) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x85));
elseif (player:getRank() == 4) and (mission_status ~= 0) and (player:getMissionStatus(0,13) == 0) and (has_rank_points_for_mission(player, 13)) then
	player:startEvent(Event(0x30));
elseif (player:getRank() == 4) and (mission_status == 0) then
	if (has_rank_points_for_mission(player, 13)) then
		player:startEvent(Event(0x2d));
	else
		player:startEvent(Event(0x31));
	end
elseif (player:getMissionStatus(0,13) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x88));
elseif (player:getRank() == 4) and (mission_status == 6) then
	player:startEvent(Event(0x24));
elseif (player:hasKeyItem(MessageToJeunoSandy) == 1) then
	player:startEvent(Event(0x38));
elseif (player:getRank() == 5) and (((player:getMissionStatus(0,14) == 0) and (mission_status == 0)) or (player:getMissionStatus(0,14) > 0))  then
	player:startEvent(Event(0x6A));
else
	player:startEvent(Event(0x66));
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
if (csid == 0x02A) then
	player:setVar("mission_status",4);
elseif (csid == 0x43) and (DEBUG_MODE) then
	player:addItem(549);
	player:setPos(345, 0, 19, 250, 0xB8); -- to Lower Delkfutt's Tower shortcut door
elseif (csid == 0x24) then
	player:completeMission(0,13);
	player:specialMessage(KEYITEM_OBTAINED,MessageToJeunoSandy);
	player:addKeyItem(MessageToJeunoSandy);
	player:addGil(GIL_RATE*10000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*10000); 
	player:rankUp();
	player:setVar("mission_status",0);
elseif (csid == 0x38) and (DEBUG_MODE) then
	player:setPos(88, 1, -53, 32, 0xE6);	-- to Ambrotien
end
end;