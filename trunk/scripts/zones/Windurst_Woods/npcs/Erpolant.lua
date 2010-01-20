-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Erpolant
-- 	Part of San d'Oria Mission 2-3.  Her other events are 0x1c6,0x1cc,0x1d2,and 0x1d5. 
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-- events

-- 01BC default response for non- San d'Orian citizens
-- 01BF default response for San d'Orian citizens
-- 01C6 "act according to our convictions while fulfilling our promise with the Tarutaru."
-- 01CC "now that you have completed that little mission of amity, you are just an ordinary San d'Orian citizen again. So that frees you to
--       go to Giddeus and really give those beastmen what they deserve."
-- 01D2 "Becoming a soldier is a completely different way of life.. sometimes you have to go against your personal convictions.."
-- 01D5 "Consul Mourice's face has blanched. Did you say something to upset him? Did you not complete your mission correctly?"


-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


nation = player:getNation();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Different dialogue for San d'Orians.
if ((player:hasKeyItem(KindredCrest) == 1) or (player:hasKeyItem(KindredReport) == 1)) and (player:getMissionStatus(0,9) == 1) then 
  player:startEvent(Event(0x1D5));
elseif (player:getVar("sandy_shield_mission") == 1) then
	player:startEvent(Event(0x1d5));
elseif (player:getMissionStatus(0,7) == 1) and (mission_status >= 10) and (mission_status <=11) then
	player:startEvent(Event(0x1c6));
elseif (player:getMissionStatus(0,9) == 1) and (mission_status >= 7) then
  player:startEvent(Event(0x1C6));
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 14) then
	player:startEvent(Event(0x1cc));
elseif (nation ~= 0) then
	player:startEvent(Event(0x1BC));
else
	player:startEvent(Event(0x1BF));
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