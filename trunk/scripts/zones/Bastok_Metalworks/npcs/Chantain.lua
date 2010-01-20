-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Chantain
-- 	Basic Chat Text, Sandy Mission 2-3
-----------------------------------
-- Includes
require("scripts/globals/rankpoints");
require("scripts/globals/settings");
-----------------------------------
--[[ Events

0xCB complains that Bastok has no tradition or elegance.
0xD8 player has letter of introduction (2-3)
0xD9 "Fare Well, Adventurer" (2-3)
0xDA "It's good to see you are safe. San d'Oria awaits you, my friend! Go to her while you can!"

--]]
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(0,5) == 1) and ((mission_status == 2) or (mission_status == 14)) then
	player:startEvent(Event(0xD8));
elseif (player:getMissionStatus(0,6) == 1) or (player:getMissionStatus(0,8) == 1) then
	player:startEvent(Event(0xD9));
elseif (player:hasKeyItem(KindredReport) == 1) then
	player:startEvent(Event(0xDA));
else
	player:startEvent(Event(0xCB));
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
end;