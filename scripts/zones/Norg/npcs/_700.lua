-----------------------------------
--	Author: ReaperX
-- 	_700
-- 	Door to Gilgamesh's room
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--- events --
--- 2 : CS for ZM2 "Welcome t'Norg"
--- 3 : CS for ZM9 "Ro'Maeve"


zilart_status = player:getVar("zilart_status");

if (player:getMissionStatus(3,4) == 1) then
  player:startEvent(Event(2));
elseif (player:getMissionStatus(3,18) == 1) and (zilart_status == 2) then
 player:startEvent(Event(3))
else
  npc:setState(5);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 2) then
  player:completeMission(3,4)
  player:currentMission(3,6);
end
end;