-----------------------------------
-- ??? @ H-7 Xarcabard (for Sandy Mission 9-1 "Breaking Barriers"
-- Author: ReaperX
-----------------------------------

require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
require("scripts/zones/Xarcabard/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:getMissionStatus(0,22) == 1) and (player:getVar("mission_status") == 3) then
  player:addKeyItem(FigureOfGaruda);
  player:specialMessage(KEYITEM_OBTAINED,FigureOfGaruda);
  player:setVar("mission_status",4);
else
	player:specialMessage(1454); -- "It looks like something was buried here."
end

if (player:hasKeyItem(FigureOfGaruda) == 1) and (DEBUG_MODE) then
	player:setPos(217, 16, -609 ,128, 0x69);
end;
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;