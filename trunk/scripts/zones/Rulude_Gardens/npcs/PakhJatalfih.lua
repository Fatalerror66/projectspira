-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Pakh Jatalfih
-- 	Basic Chat Text, Windurst Mission 3-3
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
require("scripts/zones/Rulude_Gardens/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

--[[ Events

0067 -- default response for Windurstian citizens.
0034 -- San d'Orian -> go to other side
0033 -- Bastokan -> outside on the left
002B -- 3.3 Wolfgang CS
0044 -- 3.3 repeats instructions on how to get to Delfkutt's Tower
008D -- 3.3 after Ambassador has returned
0036 "for now we need your help in conquest"
0035 "His excellency needs your help.Come Back once you've completed your current mission."
0032 "His excellency seeks your help in something important. Best head into the rear chamber."
0083 opening CS for 4.1 "Magicite" (Windurst)
0086 "you musn't keep the archduke waiting!"
0089 "so you saw the archduke. Well, how did it go?"
0025 rank 5
0039 Hurry and take the airship back to Windurst!
006B Continue your service for the country.


--]]

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status =  player:getVar("mission_status");

if (player:getMissionStatus(2,12) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x2B));
elseif (player:getMissionStatus(2,12) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x44));
elseif (player:getMissionStatus(2,12) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x8D));
elseif (player:getNation() == 0) then
	player:startEvent(Event(0x34));
elseif (player:getNation() == 1) then
	player:startEvent(Event(0x33));
elseif (player:getRank() == 4) and (mission_status == 1) then
	player:startEvent(Event(0x86));
elseif (player:getRank() == 4) and (mission_status ~= 0) and (player:getMissionStatus(2,13) == 0) and (has_rank_points_for_mission(player, 13)) then
	player:startEvent(Event(0x35));
elseif (player:getRank() == 4) and (mission_status == 0) then
	if (has_rank_points_for_mission(player, 13)) then
		player:startEvent(Event(0x32));
	else
		player:startEvent(Event(0x36));
	end
elseif (player:getMissionStatus(0,13) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x89));
elseif (player:getRank() == 4) and (mission_status == 6) then
	player:startEvent(Event(0x25));
elseif (player:hasKeyItem(MessageToJeunoWindurst) == 1) then
	player:startEvent(Event(0x39));
elseif (player:getRank() == 5) and (((player:getMissionStatus(0,14) == 0) and (mission_status == 0)) or (player:getMissionStatus(0,14) > 0))  then
	player:startEvent(Event(0x6B));
else
	player:startEvent(Event(0x67));
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
if (csid == 0x02B) then
	player:setVar("mission_status",3);
elseif (csid == 0x02B) and (DEBUG_MODE) then
	player:setPos(460, 0, -103, 184, 0xB8);
elseif (csid == 0x25) then
	player:completeMission(2,13);
	player:specialMessage(KEYITEM_OBTAINED,MessageToJeunoWindurst);
	player:addKeyItem(MessageToJeunoWindurst);
	player:addGil(GIL_RATE*10000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*10000); 
	player:rankUp();
	player:setVar("mission_status",0);
elseif (csid == 0x39) and (DEBUG_MODE) then
	toWindurstMissionOverseer(player);
elseif (csid == 0x44) and (DEBUG_MODE) then
	player:addItem(549);
	player:setPos(345, 0, 19, 250, 0xB8); -- to Lower Delkfutt's Tower shortcut door
end;
end;