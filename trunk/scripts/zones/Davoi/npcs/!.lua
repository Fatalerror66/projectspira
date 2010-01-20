-----------------------------------
-- !
-- to get key item "lost Document" in Sandy mission 2-2 "The Davoi Report"
-- by ReaperX

-- Speculative behavior: message 957 for first completion, 958 for repeat.

	
	-- NPC ids for the different exclamation points.

	south_ep = 17388003  -- at L-8
	pond_ep  = 17388005  -- at pond J-8
	east_ep  = 17388002  -- at K-7
  north_ep = 17388004  -- at J-7

package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
npcid = npc:getId();
mission_status = player:getVar("mission_status");

if (npcid == pond_ep) and ((player:getMissionStatus(0,4) == 1) or (player:getVar("repeat_mission") == 4)) and (player:getVar("mission_status") == 2) then
  if (player:getMissionStatus(0,4) == 1) then
    player:specialMessage(SANDY_MISSION_OFFSET + 2);
  else
  	player:specialMessage(SANDY_MISSION_OFFSET + 3);
  end;
  player:setVar("mission_status",3);
  player:addKeyItem(LostDocument);
  player:specialMessage(KEYITEM_OBTAINED,LostDocument);
elseif (npcid == east_ep) and (player:getVar("repeat_mission") == 10) and (mission_status == 2) and (player:hasKeyItem(EastBlockCode) == 0) then
	player:specialMessage(KEYITEM_OBTAINED,EastBlockCode);
	player:addKeyItem(EastBlockCode);
elseif (npcid == north_ep) and (player:getVar("repeat_mission") == 10) and (mission_status == 2) and (player:hasKeyItem(NorthBlockCode) == 0) then
	player:specialMessage(KEYITEM_OBTAINED,NorthBlockCode);
	player:addKeyItem(NorthBlockCode);
elseif (npcid == south_ep) and (player:getVar("repeat_mission") == 10) and (mission_status == 2) and (player:hasKeyItem(SouthBlockCode) == 0) then
	player:specialMessage(KEYITEM_OBTAINED,SouthBlockCode);
	player:addKeyItem(SouthBlockCode);
else
	player:specialMessage(SANDY_MISSION_OFFSET + 4);
end;
end