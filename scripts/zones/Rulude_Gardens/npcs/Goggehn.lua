-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Goggehn
-- 	Basic Chat Text, Bastok Mission 3.3 "Jeuno"
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
require("scripts/zones/Rulude_Gardens/TextIDs");
--package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
-----------------------------------
-- Initialization

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

--- Goggehn events ---------

-- 0000 "The ambassador wants you for a special operation. Get to the briefing, pronto!"
-- 0001 tells San d'Orians to go to the other embassy
-- 0002 tells Windurstians to go to the other embassy
-- 0003 "The Ambassador wants a word with you"
-- 0004 "for now, the administration needs your help in the conquest and security of the regions bordering Jeuno."
-- 0023 final CS for 4.1 "Magicite" (Bastok) + rank 5, tells you to go back to Bastok by airship.
-- 0026 (Altair event) final CS for 3.3 "Jeuno" - rank 4!
-- 0029 CS for 3.3 "Jeuno"
-- 0037 "Get on that airship to Bastok soldier!"
-- 0042 repeats instructions to go to Delkfutt's Tower for 3.3 "Jeuno"
-- 008B end of (3.3 "Jeuno")
-- 0081 opening CS for 4.1 "Magicite" (Bastok)
-- 0084 repeats instructions to seek an audience with the arch duke (4.1)
-- 0087 4.1 after audience
-- 0069 have no new missions
-- 0065 "Welcome to the embassy of Bastok. " 

jeuno_status = player:getMissionStatus(1,12);          -- Jeuno
mission_status =  player:getVar("mission_status");

if (jeuno_status == 1) and (mission_status == 2) then
	player:startEvent(Event(0x29));
elseif (jeuno_status == 1) and (mission_status == 3) then
	player:startEvent(Event(0x42));
elseif (jeuno_status == 1) and (mission_status == 4) then
	player:startEvent(Event(0x8B));
elseif (player:getNation() == 0) then
	player:startEvent(Event(2));  -- for Windy citizens
elseif (player:getNation() == 2) then
	player:startEvent(Event(1));  -- for Sandy citizens
elseif (player:getRank() == 4) and (mission_status == 0) then
	if (has_rank_points_for_mission(player, 13)) then
		player:startEvent(Event(0x0));-- for Magicite briefing
	else
		player:startEvent(Event(0x4));
	end
elseif (player:getRank() == 4) and (mission_status == 2) then
	player:startEvent(Event(0x87));
elseif (player:getRank() == 4) and (mission_status == 1) then
	player:startEvent(Event(0x84));
elseif (player:getRank() == 4) and (mission_status == 6) then
	player:startEvent(Event(0x23));
elseif (player:hasKeyItem(MessageToJeunoBastok) == 1) then
	player:startEvent(Event(0x37));
elseif (player:getMissionStatus(1,13) == 2) then
	player:startEvent(Event(0x69));
else
	player:startEvent(Event(0x65));
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
if (csid == 0x29) then
	player:setVar("mission_status",3);
elseif (csid == 0x23) then
	player:completeMission(1,13);
	player:specialMessage(KEYITEM_OBTAINED,MessageToJeunoBastok);
	player:addKeyItem(MessageToJeunoBastok);
	player:addGil(GIL_RATE*10000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*10000); 
	player:rankUp();
	player:setVar("mission_status",0); 
elseif (csid == 0x42) and (DEBUG_MODE) then
	player:addItem(549);
	player:setPos(345, 0, 19, 250, 0xB8); -- to Lower Delkfutt's Tower shortcut door
elseif (csid == 0x37) and (DEBUG_MODE) then
	player:setPos(130, 8, -4, 225, 0xEC); -- to Argus
end
end;