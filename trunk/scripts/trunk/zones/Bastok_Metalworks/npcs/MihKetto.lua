-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Mih Ketto
-- 	Basic Chat Text, Windurst Mission 2-3
-----------------------------------

--[[

0x0FD Hello? Yes, this is the Windurst consulate.
0x10A A letter of introduction? Go talk to the consul, there.
0x10B Going fighting? Good luck.
0x10C Your mission is over? Make it to Windurst safely.

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
if (player:getMissionStatus(2,5) == 1) and ((mission_status == 2) or (mission_status == 14)) then
	player:startEvent(Event(0x10A));
elseif (player:getMissionStatus(2,5) == 1) and (mission_status == 6) then
	player:startEvent(Event(0x10B));
elseif (player:getMissionStatus(2,7) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x10B));
else
	player:startEvent(Event(0xFD));
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
end;