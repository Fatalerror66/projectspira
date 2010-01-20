-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Pius
-- 	Basic Chat Text, Three Nations mission for San d'Oria and Windurst
-----------------------------------

--[[ Events 
015E default "greeting"
0163 gives you mission
0164 repeats mission instructions
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
on_first_path = (player:getMissionStatus(0,6) == 1) or (player:getMissionStatus(2,7) == 1) -- on Sandy or Windy 2-3, 1st path?
on_second_path = (player:getMissionStatus(0,8) == 1) or (player:getMissionStatus(2,9) == 1) -- on Sandy or Windy 2-3, second path?

if (on_first_path and mission_status == 3) or (on_second_path and mission_status == 15) then
	event = Event(0x163);
	if (player:getNation() == 2) then
		event:setParams(1);
	end;
	player:startEvent(event);
elseif (on_first_path and mission_status == 4) or (on_second_path and mission_status == 16) then
	player:startEvent(Event(0x164));
else
	player:startEvent(Event(0x15E));
end;
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x163) then
	if (player:getMissionStatus(0,6) == 1) or (player:getMissionStatus(2,7) ==1) then
	  player:setVar("mission_status",4);
	else
	  player:setVar("mission_status",16);
	end;
end
end;