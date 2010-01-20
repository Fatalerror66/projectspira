-----------------------------------
-- Vicorpasse
-- NPC for Sandy mission 2-1 "The Rescue Drill"
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
	if (mission_status == 4) then
    player:startEvent(Event(0x6C));
  elseif (mission_status >= 5) and (mission_status <= 7) then
    player:showText(npc, RESCUE_DRILL + 19);
  elseif (mission_status == 8) then
	  player:showText(npc, RESCUE_DRILL + 21);
  elseif (mission_status == 9) then
	  player:showText(npc, RESCUE_DRILL + 26);
	elseif (mission_status == 10) then
	  player:startEvent(Event(0x73));
	elseif (mission_status == 11) then
	  player:showText(npc, RESCUE_DRILL + 30);
  end
else
	player:showText(npc, RESCUE_DRILL);
end;
if (player:hasKeyItem(RescueTrainingCertificate) == 1) and (DEBUG_MODE) then
    player:setPos(88, 1, -53, 32, 0xE6);	-- to Ambrotien
end;
end

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x6C) then
  player:setVar("mission_status",5);
elseif (csid == 0x73) then
	player:setVar("mission_status",11);
	player:specialMessage(KEYITEM_OBTAINED,RescueTrainingCertificate);
	player:addKeyItem(RescueTrainingCertificate);
	player:setVar("npc_has_sword",0);
end;
end;