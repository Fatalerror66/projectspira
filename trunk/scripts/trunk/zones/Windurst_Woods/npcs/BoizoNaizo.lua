-----------------------------------
--	Author: Tenjou
-- 	Boizo-Naizo
-- 	Changes dialogue during Mission 1-2.
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

 
--Mission Flags--
windyonetwo = player:getVar("theHeartOfTheMatter");
windyonetwoa = player:getVar("theHeartOf-ApururuCS");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--check status of Windurst Mission 1-2 --
if (windyonetwo == 1 and windyonetwoa == 1) then
	player:startEvent(Event(0x8b));
elseif (windyonetwo == 2) then
	player:startEvent(Event(0x8b));
elseif (windyonetwo == 3) then
	player:startEvent(Event(0x92));
else
	player:startEvent(Event(0x113));
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