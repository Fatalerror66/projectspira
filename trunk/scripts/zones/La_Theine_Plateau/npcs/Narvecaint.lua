-----------------------------------
-- Narvecaint
-- NPC 4 for Sandy mission 2-1 "The Rescue Drill"
-- by ReaperX

package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
mission_status = player:getVar("mission_status");

if (player:getMissionStatus(0,3) == 1) then 
	if (mission_status == 6) then
    player:startEvent(Event(0x6B));
  elseif (mission_status == 7) then
    player:showText(npc, RESCUE_DRILL + 14);
  elseif (mission_status == 8) then
	  player:showText(npc, RESCUE_DRILL + 21);
  elseif (mission_status >= 9) then
	  player:showText(npc, RESCUE_DRILL + 26);
  end;
else
	player:showText(npc, RESCUE_DRILL);
end;
end

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x6B) then
  player:setVar("mission_status",7);
end
end;