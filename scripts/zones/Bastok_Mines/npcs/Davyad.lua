-----------------------------------
--	Author: ReaperX
-- 	Davyad
-- 	Bastok Mission 3.2 "To the Forsaken Mines"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- Events -----------------
-- 0035: default event 
-- 0036: 3.2 CS
-- (00B0): 8.2 CS rank9!!

forsaken_mines_status = player:getMissionStatus(1,11); -- To the Forsaken Mines
mission_status = player:getVar("mission_status");
repeat_mission = player:getVar("repeat_mission");

if ((forsaken_mines_status == 1) or (repeat_mission == 11)) and (mission_status == 1) then
  player:startEvent(Event(0x36));
elseif ((forsaken_mines_status == 1) or (repeat_mission == 11)) and (mission_status == 2) then
  player:showText(npc, 3491); -- Trade some bait to a special spot on the ground, and it'll come.
  if (DEBUG_MODE) then
  	player:setPos(205, -60, -100, 9, 0xC4);     -- to Gusgen Mines
  end;
else
  player:startEvent(Event(0x35));
end;
end; 

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

if (csid == 0x36) then
   player:setVar("mission_status",2);
end;
end;