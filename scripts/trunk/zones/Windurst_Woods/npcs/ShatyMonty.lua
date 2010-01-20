-----------------------------------
--	Author: Tenjou
-- 	Shaty-Monty
-- 	Teaches players about Kamp Kweh,a feature not yet in pXI.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

playerid = player:getId();
local kweh = seenEvent(playerid,0x2ff,0xf1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (kweh == "0") then
	player:startEvent(Event(0x2ff));
	addEvent(playerid,0x2ff,0xf1,1);
elseif (kweh == "1") then
	player:startEvent(Event(0x307));
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
--print("CSID:",csid);
--print("RESULT:",option);
end;