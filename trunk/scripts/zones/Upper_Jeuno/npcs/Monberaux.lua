-----------------------------------
--	Author: Arcanedemon, ReaperX, Tenjou
-- 	Monberaux
-- 	Basic Chat Text + CoP Mission 1.1 "The Rites of Life"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

cop_status = player:getMissionStatus(6,1); --Var("COP_MISSION_STATUS");
if (cop_status == 1) then 
  event = Event(0xA);
elseif (cop_status == 2) then
  event = Event(0x9);
else
  event = Event(0x6D);
end;
player:startEvent(event);
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
if (csid == 0x000A) then
  player:addKeyItem(0x0243) -- add keyitem mysterious amulet
  player:specialMessage(KEYITEM_OBTAINED,0x243);    -- mysterious amulet;
  --Update Mission Logs
  player:currentMission(6,2);
end
end;