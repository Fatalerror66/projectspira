-----------------------------------
--	Author: Arcanedemon
-- 	Topuru-Kuperu
-- 	Basic Chat Text
-----------------------------------

--[[

00FB default response
0104 A letter of introduction? ..
0105 You're going where all those monsters are, aren't you?
0106 You've made it back. Then you are returning to Windurst. Oh, how I envy you..
0100
00FF
0101

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

mission_status = player:getVar("mission_status");

if (player:getMissionStatus(2,5) == 1) and ((mission_status == 2) or (mission_status == 14)) then
	player:startEvent(Event(0x104));
elseif (player:getMissionStatus(2,7) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x105));
else
	player:startEvent(Event(0xFB));
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