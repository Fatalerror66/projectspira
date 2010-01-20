-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Catalia
-- 	Part of San d'Oria Mission 2-3.  Her other events are 0x1c4,0x1cb,0x1d1,and 0x1d6. 
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-- events

-- 01BA default response for non Sandy citizens
-- 01BB default response for Sandy citizens
-- 01C4 "No Elvaan would ever do something as dishonorable as breaking a promise to another."
-- 01CB "The Republic of Bastok is occupied by two races.."
-- 01D1 "The apparent tranquility of this place can be considered an illusion born from idealism.. until we wake Windurst from its dream.."  
-- 01D6 "Do not tell me we are marching into another Great War?"

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


nation = player:getNation();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Different dialogue for San d'Orians.
mission_status = player:getVar("mission_status");

if ((player:hasKeyItem(KindredCrest) == 1) or (player:hasKeyItem(KindredReport) == 1)) and (player:getMissionStatus(0,9) == 1) then 
  player:startEvent(Event(0x1d6));
elseif (player:getMissionStatus(0,7) == 1) and (mission_status == 10) then
	player:startEvent(Event(0x1d1));
elseif (player:getVar("sandy_shield_mission") == 1) then
	player:startEvent(Event(0x1c4));
elseif (player:getMissionStatus(0,7) == 1) and (mission_status == 11) then
	player:showText(npc,2040); -- "While we cannot break our promise to the Windurstians.."	
elseif (player:getMissionStatus(0,5) == 1) and (mission_status == 14) then
	player:startEvent(Event(0x1cb));
elseif (player:getMissionStatus(0,9) == 1) and (mission_status >= 7) then
	player:startEvent(Event(0x1d1));
elseif (nation ~= 0) then
	player:startEvent(Event(0x1ba));
else
	player:startEvent(Event(0x1bb));
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