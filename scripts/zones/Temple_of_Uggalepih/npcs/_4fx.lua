-----------------------------------
--	Author: ReaperX
--  Granite Door on map 3, J-6 (opens with Cursed Key);
--  for Windurst Mission 7-2

-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/globals/rankpoints");

-- door events:
-- 0x19 enter library on map 3, J-6 (for Windurst mission)
-- 0x1A exit of library on map 3, J-6
-- 0x41 "you could not find lightbringer here. Your investigation is over." (Sandy mission)
-- 0x2E zone into paintbrush room
-- 0x2F exit paintbrush room
-- 0x28 teleport into paintbrush room
-- 0x29 teleport into paintbrush room

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
z = player:getZPos();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (z < 331) then
	player:specialMessage(MISSIONS - 66); -- "The door is locked."
elseif (player:getMissionStatus(2,19) == 1) and (player:getVar("mission_status") == 5) and (DEBUG_MODE) then
	toLeepeHoppe(player)
else
	player:startEvent(Event(0x1A));
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if(trade:getItemCount() == 1 and trade:hasItemQty(CursedKey,1)) then
	trade:isComplete();
	player:startEvent(Event(0x19));
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;