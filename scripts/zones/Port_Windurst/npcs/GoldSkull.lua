-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Gold Skull
-- 	Involved in Bastok Mission 2-3. 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-- events
-- 0x32: "you are to proceed to Heaven's tower and obtain a shipment of magical weapons."
-- 0x35: switches swords.
-- 0x36: "Take that sword to Giddeus. Good luck."
-- 0x39: prays you'll have a safe journey.
-- 0x3E: "you are to receive a key from heaven's tower, here in Windurst, and defeat the great monster that has appeared.."
-- 0x44: I constantly pray. I pray for the future of Bastok. And I polish my fangs in case the days of war are near again."

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

emissary_status1 = player:getMissionStatus(1,9);      -- The Emissary Windurst (Windy 2nd path)
emissary_status2 = player:getMissionStatus(1,7);      -- The Emissary Windurst (Windy first path)

mission_status = player:getVar("mission_status");

--print("mission status, emissary status, emissary status1, emissary status 2",mission_status, emissary_status, emissary_status1, emissary_status2);

if (emissary_status1 == 1) and (mission_status == 7) then
  player:startEvent(Event(0x3E))
elseif (emissary_status1 == 1) and (mission_status == 8) then
 player:showText(npc,74)		                                         -- "good luck with your mission!"
elseif (emissary_status2 == 1) and (mission_status == 10) then
  player:startEvent(Event(0x32))
elseif (player:hasKeyItem(SwordOffering) == 1) then
  player:startEvent(Event(0x35))
elseif (emissary_status2 == 1) and (mission_status == 12) then       													     
  player:startEvent(Event(0x36))
elseif (emissary_status2 == 1) and (mission_status == 14) then       
  player:showText(npc,47)																				     -- mission went without incident?
elseif ((emissary_status2 == 1) and (mission_status == 15)) or ((emissary_status1 == 1) and (mission_status == 9)) then       
  player:startEvent(Event(0x39));
elseif (player:hasKeyItem(KindredReport) == 1) then 
  player:startEvent(Event(0x44));
else
  player:startEvent(Event(0x2b));
end; 
end
 

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
if (csid == 0x35) then
  player:setVar("mission_status",12);  --> Gideus next
  player:addKeyItem(DullSword) -- 
  player:specialMessage(KEYITEM_OBTAINED,DullSword); 
  player:removeKeyItem(SwordOffering) -- remove sword offering
end;
end;