-----------------------------------
--	Author: ReaperX
--  Tombstone
--  for Sandy Mission 6.2
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
require("scripts/zones/King_Ranperres_Tomb/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
--print(npcid,npcname);
mission_status = player:getVar("mission_status");
if (player:getZPos() < -95) then     -- Ranperre's false grave upstairs
	if (player:getMissionStatus(0,1) == 1) and (mission_status == 1) then
		player:startEvent(Event(0x4));
	else
		player:specialMessage(SANDY_MISSION_OFFSET+3); -- "it looks like a grave."
	end
else
	if (player:getMissionStatus(0,17) == 1) and (mission_status == 3) then
		player:startEvent(Event(0x8));-- CS with Rochefogne
	else
		player:specialMessage(SANDY_MISSION_OFFSET+4); -- "it appears to be the true resting place of King Ranperre".
	end
end
if (DEBUG_MODE) and (mission_status == 2) then
  player:setPos(88, 1, -53, 32, 0xE6);	-- to Ambrotien
end;

end;

function onEventFinish(player,csid,option)
if (csid == 0x8) then
	player:specialMessage(KEYITEM_OBTAINED,AncientSandOrianBook);
	player:addKeyItem(AncientSandOrianBook);
	player:setVar("mission_status",4);
elseif (csid == 0x4) then
	player:setVar("mission_status",2);
end
end;
