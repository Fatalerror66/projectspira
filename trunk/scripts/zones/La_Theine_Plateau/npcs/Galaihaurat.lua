-----------------------------------
-- Galaihaurat
-- NPC 1 for Sandy mission 2-1 "The Rescue Drill"
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
	if (mission_status == 1) then
    player:startEvent(Event(0x6E));
  elseif (player:getVar("npc_has_sword") == 1) and (mission_status == 8) then
    player:startEvent(Event(0x72)); 
  elseif (player:getVar("npc_has_sword") == 1) and (mission_status == 9) then
    player:showText(npc, RESCUE_DRILL + 25);
  elseif (player:getVar("npc_has_sword") ~= 1) and (mission_status == 8) then
	  player:showText(npc, RESCUE_DRILL + 21);
  elseif (player:getVar("npc_has_sword") ~= 1) and (mission_status == 9) then
	  player:showText(npc, RESCUE_DRILL + 26);
	elseif (mission_status >= 10) then
		 player:showText(npc, RESCUE_DRILL + 30);
  elseif (mission_status == 2) then
    player:showText(npc, RESCUE_DRILL + 16);
    if (DEBUG_MODE) then
    	player:setPos(-286, 8.9, 282, 190); -- to Equesobillot
    end;
  end;
elseif (player:getMissionStatus(0,3) == 2) then
  player:showText(npc, RESCUE_DRILL + 30);
else
	player:showText(npc, RESCUE_DRILL); -- "Rescue drills in progress. Try to stay out of the way."
end;
end

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x6E) then
  player:setVar("mission_status",2);
  player:setVar("npc_has_sword",0); -- initialize variable who has the sword - right now, no one.
elseif (csid == 0x72) then
	player:setVar("mission_status",9);
	player:addItem(BronzeSword);
	player:specialMessage(ITEM_OBTAINED,BronzeSword);
end
end;