-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	DancingWolf
-- 	Basic Chat Text, Bastok Mission 9.1
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
if (player:getMissionStatus(1,22) == 1) and (mission_status == 2) then -- 9.2 CS "The Salt of the Earth"
  player:startEvent(Event(0x66));
elseif (player:getMissionStatus(1,22) == 1) and (mission_status == 3) then -- 9.2 CS "The Salt of the Earth"
  player:startEvent(Event(0x67));
elseif (player:getMissionStatus(1,22) == 1) and (mission_status == 4) then -- player has returned with miraclesalt
  player:startEvent(Event(0x68));
elseif (player:getMissionStatus(1,22) == 1) and (mission_status == 5) then 
  player:startEvent(Event(0x69));
else
  player:startEvent(Event(0x006A));
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
if (csid == 0x66) then
  player:setVar("mission_status",3);
elseif (csid == 0x67) then
	player:setPos(-115, 0, 244, 157, 0xAE);     -- to Gustav
elseif (csid == 0x68) then
  player:setVar("mission_status",5);
elseif (csid == 0x69) and (DEBUG_MODE) then 
	player:setPos(95, -20, 14, 120, 0xED);     -- to Alois
end
end;