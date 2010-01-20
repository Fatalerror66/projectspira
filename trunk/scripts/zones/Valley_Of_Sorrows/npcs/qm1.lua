-----------------------------------
-- ??? @ I-8 VoS (for Sandy Mission 9-1 "Breaking Barriers"
-- Author: ReaperX
-- 
-----------------------------------

package.loaded["scripts/globals/rankpoints"] = nil;
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Valley_Of_Sorrows/TextIDs"] = nil;
require("scripts/zones/Valley_Of_Sorrows/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:getMissionStatus(0,22) == 1) and (player:getVar("mission_status") == 2) then
  player:addKeyItem(FigureOfTitan);
  player:specialMessage(KEYITEM_OBTAINED,FigureOfTitan);
  player:setVar("mission_status",3);
else
	player:specialMessage(981); -- "It looks like something was buried here."
end

if (player:hasKeyItem(FigureOfTitan) == 1) and (DEBUG_MODE) then
	player:setPos(170, -35, 82, 0, 0x70);
end;

end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;