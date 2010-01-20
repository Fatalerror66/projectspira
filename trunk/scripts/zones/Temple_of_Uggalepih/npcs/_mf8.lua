-----------------------------------
--	Author: ReaperX
--  East Granite Door in Manipulator Room (opens with Prelate Key);
--  (leads to map 4 for Sandy mission 8-2 "Lightbringer and Carby Mitts NM)
--
-- couldn't find a suitable event, so instant ports as workarounds for now.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");

PrelateKey = 1137;

-- door events:
-- 0x19 enter library on map 3, J-6 (for Windurst mission)
-- 0x1A exit of library on map 3, J-6
-- 0x41 "you could not find lightbringer here. Your investigation is over."
-- 0x2E zone into paintbrush room
-- 0x2F exit paintbrush room
-- 0x28 teleport into paintbrush room
-- 0x29 teleport into paintbrush room

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
x = player:getXPos();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (x > -62) then
	player:specialMessage(908,PrelateKey);
else
	player:setPos(player:getXPos()-5,player:getYPos(),player:getZPos(),128);
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if(trade:getItemCount() == 1 and trade:hasItemQty(PrelateKey,1)) then
	trade:isComplete();
	player:specialMessage(911,0000,PrelateKey);
	player:setPos(player:getXPos()+5,player:getYPos(),player:getZPos(),0);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;