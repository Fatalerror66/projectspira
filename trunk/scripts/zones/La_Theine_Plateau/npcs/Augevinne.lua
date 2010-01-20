-----------------------------------
-- Augevinne
-- NPC for Sandy mission 2-1 "The Rescue Drill"
-- by ReaperX

package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
require("scripts/zones/La_Theine_Plateau/TextIDs");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:getMissionStatus(0,3) == 1) then
	if (player:getVar("mission_status") >= 5) and (player:getVar("mission_status") <= 7) then
    player:startEvent(Event(0x67));
  elseif (mission_status == 8) then
	  player:showText(npc, RESCUE_DRILL + 21);
  elseif (mission_status >= 9) then
	  player:showText(npc, RESCUE_DRILL + 26);
  end;
else
	player:showText(npc, RESCUE_DRILL );
end;
end

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
end;