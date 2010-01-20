-----------------------------------
--	Author: ReaperX
-- 	Bastokan Ambassador: Melek
-- 	Starts parts of Bastok Mission 2-3.  
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
emissary_status = player:getMissionStatus(1,5);       -- The Emissary
emissary_status1 = player:getMissionStatus(1,9);      -- The Emissary Windurst (Windy 2nd path)
emissary_status2 = player:getMissionStatus(1,7);      -- The Emissary Windurst (Windy first path)

mission_status = player:getVar("mission_status");
local embassy = math.random();

if (player:getMissionStatus(1,5) == 1) and (mission_status == 6) then  -- coming from Sandy?
  player:startEvent(Event(0x3D)) 
elseif (emissary_status1 == 1) and (mission_status == 7) then
  player:startEvent(Event(0x40)) 
elseif (player:hasKeyItem(KindredCrest) == 1) then 
  player:startEvent(Event(0x42));
elseif (player:hasKeyItem(KindredReport) == 1) then 
  player:startEvent(Event(0x43));
elseif (emissary_status1 == 1) and (mission_status == 8) then
 player:showText(npc,74)		                                         -- "good luck with your mission" (may not be correct response)
elseif (emissary_status1 == 1) and (mission_status == 9) then
  player:startEvent(Event(0x43)) 
elseif (emissary_status == 1) and (mission_status == 1) then
  player:startEvent(Event(0x30))                                     -- first CS for Windy-> Sandy
elseif (emissary_status2 == 1) and (mission_status == 10) then
  player:startEvent(Event(0x31))  
elseif (player:hasKeyItem(SwordOffering) == 1) then
  player:startEvent(Event(0x35))
elseif (emissary_status2 == 1) and (mission_status == 12) then       
  player:showText(npc,2466)																				     -- "take that sword to Giddeus"
elseif (emissary_status2 == 1) and ((mission_status == 14) or (mission_status == 14.5))then
  player:startEvent(Event(0x37)) 																		 -- to Sandy now 
  elseif (emissary_status2 == 1) and (mission_status == 15) then
  player:showText(npc,2472)																			       -- I hope to see you safe and well again some day
elseif (embassy >= .5) then
	player:startEvent(Event(0x29));
else
	player:startEvent(Event(0x2a));
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
if (csid == 0x3D) then
  player:currentMission(1,9);         -- update mission to "The Emissary (Windurst)"
  player:removeKeyItem(6)             -- remove "Letter to the Consuls" (bastok version)
  player:setVar("mission_status",7);  -- speak to Kupipi now
elseif (csid == 0x30) then
  player:setVar("mission_status",10); -- indicates Windy->Sandy path
  player:currentMission(1,7);         -- update mission to "The Emissary (Windurst) (windy first path)"
elseif (csid == 0x35) then
  player:setVar("mission_status",12);  --> Gideus next
  player:addKeyItem(DullSword) -- 
  player:specialMessage(KEYITEM_OBTAINED,DullSword); 
  player:removeKeyItem(SwordOffering) -- remove sword offering
elseif (csid == 0x42) then
  player:setVar("mission_status",10);  -- return to Bastok
  player:addKeyItem(KindredReport)             
  player:specialMessage(KEYITEM_OBTAINED,KindredReport); 
  player:removeKeyItem(KindredCrest)           
elseif (csid == 0x37) then
  player:setVar("mission_status",15); -- to Sandy now
end
end;