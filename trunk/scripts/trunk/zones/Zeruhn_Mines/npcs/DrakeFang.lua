-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	DrakeFang
-- 	Basic Chat Text, Bastok Missions 6.2, 8.2
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(1,16) == 1) and (mission_status == 2) then -- 6.2 CS "Return of the Talekeepr"
  player:startEvent(Event(0xC8));
elseif (player:getMissionStatus(1,16) == 1) and (mission_status == 3) then -- repeat information
  player:startEvent(Event(0xC9));
elseif (player:getMissionStatus(1,21) == 1) and (mission_status == 1) then -- 8.2 CS "Enter the Talekeeper"
  player:startEvent(Event(0xCA));
elseif (player:getMissionStatus(1,21) == 1) and (mission_status == 2) then -- 8.2 CS "Enter the Talekeeper"
  player:startEvent(Event(0xCB));
elseif (player:hasKeyItem(OldPieceOfWood) == 1) then -- final CS for 8.2 
  player:startEvent(Event(0xCC));
else
  player:startEvent(Event(0x6C));
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
if (csid == 0xC8) then
  player:setVar("mission_status",3);
elseif (csid == 0xC9) then
  player:setPos(-316,0,-116,188,0x7D)
elseif (csid == 0xCA) then
  player:setVar("mission_status",2);
elseif (csid == 0xCA) and (DEBUG_MODE) then
  player:setPos(-28, -21, -188, 179, 0xAE);     -- to Kuftal
elseif (csid == 0xCC) then
  player:setVar("mission_status",6);
  player:setPos(-190,-8.6,-22,0,0xEA)
end
end;