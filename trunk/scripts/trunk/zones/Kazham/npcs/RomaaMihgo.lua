-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	RomaaMihgo
-- 	Basic Chat Text
--  Windurst Mission 7-2
-----------------------------------

--[[ Events

107 "..."
10A Windurst mission 7-2, tells you to go to Uggalephi
10B Windurst mission 7-2, repeats instructions
114
127
128
129
12A


--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(2,19) == 1) and (player:getVar("mission_status") == 3) then
  player:startEvent(Event(0x10A));
elseif (player:getMissionStatus(2,19) == 1) and (player:getVar("mission_status") == 4) then
  player:startEvent(Event(0x10B));
else
  player:startEvent(Event(0x107));
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
if (csid == 0x10A) then
	player:setVar("mission_status",4);
elseif (csid == 0x10B) and (DEBUG_MODE) then
  player:setPos(340, 0, 320, 192, 0x9F);
end;
end;