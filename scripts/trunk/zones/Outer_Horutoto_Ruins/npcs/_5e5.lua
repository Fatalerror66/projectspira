-----------------------------------
--	Author: ReaperX
-- 	Cracked Wall
-- 	Spawns NM Cardians in Windurst Mission 8-2
--  pop positions and message verified from
--  http://www.youtube.com/watch?v=hZ4bH2mBcts
--  http://wiki.ffxiclopedia.org/wiki/The_Jester_who%27d_be_King
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");
require("scripts/globals/teleports");

function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Windy_8_2_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Windy_8_2_LastClear"); -- how long ago they were last killed.

if (player:getMissionStatus(2,21) == 1) and (player:getVar("mission_status") == 5) and (DEBUG_MODE) then
	toManustery(player)
end;

if (player:getMissionStatus(2,21) == 1) and (mission_status == 4) then
	if (timesincelastclear < QM_RESET_TIME) then
		event = Event(0x47);
		event:setParams(0,OrasteryRing);
		player:startEvent(event);
	elseif (mobsup == 0) then
		loc = Zone(0xc2);
		loc:spawnMob("QueenofCoins", -423, 0, 618,0,nil);
		loc:spawnMob("QueenofSwords",-423, 0, 621,0,nil);
		setGlobalVar("Windy_8_2_Fight",2)
		player:specialMessage(14); -- "A GUARDIAN IS BLOCKING YOUR WAY!"
	else	
		-- door should probably become untargetable while mobs are up.
  end;
else
	player:specialMessage(MISSIONS - 1) -- "the door is firmly shut."
	-- needs to be checked on retail whether this door is otherwise closed. 
	-- npc:setState(5);
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x47) then
	player:addKeyItem(OrasteryRing);
	player:specialMessage(KEYITEM_OBTAINED,OrasteryRing)
	player:setVar("mission_status",5);
end;
end;