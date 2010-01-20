-----------------------------------
-- Deaufrain
-- NPC 3 for Sandy mission 2-1 "The Rescue Drill"
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
	if (mission_status == 3) then
    player:startEvent(Event(0x66));
  elseif (mission_status == 4) then
    player:showText(npc, RESCUE_DRILL + 4);
  elseif (player:getVar("npc_has_sword") == 3) and (mission_status == 8) then
    player:startEvent(Event(0x71)); 
  elseif (player:getVar("npc_has_sword") == 3) and (mission_status == 9) then
    player:showText(npc, RESCUE_DRILL + 25);
  elseif (player:getVar("npc_has_sword") ~= 3) and (mission_status == 8) then
	  player:showText(npc, RESCUE_DRILL + 21);
  elseif (player:getVar("npc_has_sword") ~= 3) and (mission_status >= 9) then
	  player:showText(npc, RESCUE_DRILL + 26);
	elseif (mission_status >= 10) then
		 player:showText(npc, RESCUE_DRILL + 30);
  end
else
	player:showText(npc, RESCUE_DRILL);
end;
end

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x66) then
  player:setVar("mission_status",4);
elseif (csid == 0x71) then
	player:setVar("mission_status",9);
	player:addItem(BronzeSword);
	player:specialMessage(ITEM_OBTAINED,BronzeSword);
end
end;