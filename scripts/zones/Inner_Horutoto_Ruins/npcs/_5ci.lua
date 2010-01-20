---------------------------------------------------------------------
--	Author: ReaperX
-- 	Gate of Light
--  Behind this gate, two King cardians guard the talisman that seals the Shadow Lord.. at least till rank 5.
--  Default text is currently "The door is firmly closed." Needs to be checked on retail.
---------------------------------------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");
package.loaded["scripts/globals/rankpoints"] = nil;
require("scripts/globals/rankpoints");
---------------------------------------------------------------------
-- onTrigger Action
---------------------------------------------------------------------
function onTrigger(player,npc)
	if (player:getMissionStatus(2,11) == 1) and (player:getMissionStatus(2,12) == 0) and (player:getVar("mission_status") == 2) then
		event = Event(0x29);
		event:setParams(0,CharmOfLight);
		player:startEvent(event);
	else
		player:specialMessage(MISSIONS + 28) -- "The door is firmly closed."
	end;

if (player:getMissionStatus(2,11) == 1) and (player:getMissionStatus(2,12) == 0) and (player:getVar("mission_status") == 3) then
	toZubaba(player);
end;
end;
 
---------------------------------------------------------------------
-- onTrade Action
---------------------------------------------------------------------
function onTrade(player,npc,trade)
end; 
 
---------------------------------------------------------------------
-- onEventFinish Action
---------------------------------------------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x29) then
	player:setVar("mission_status",3);
	player:removeKeyItem(CharmOfLight);
	player:setPos(-332, 0, 142, 192); -- for some reason this event leaves the player inside the door.
end;
end;