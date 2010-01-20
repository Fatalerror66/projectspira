-----------------------------------
--	Author: ReaperX
--  Gate: Ancient Magical Gizmo
-- 	Part of Windurst Mission 6-1, otherwise locked.
--  pops 4 NM cardians 
--  pop positions and pop message verified from http://www.youtube.com/watch?v=GOv-aiORmxQ

-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
require("scripts/globals/teleports");
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Windy_6_1_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Windy_6_1_LastClear"); -- how long ago they were last killed.

if (player:getMissionStatus(2,16) == 1) and (player:getVar("mission_status") == 3) and (DEBUG_MODE) then
	toOrastery(player)
end;

if (player:getMissionStatus(2,16) == 1) and (mission_status == 2) then
	if (timesincelastclear < QM_RESET_TIME) then
		player:specialMessage(MISSIONS+1,0,SoutheasternStarCharm);
		player:removeKeyItem(SoutheasternStarCharm);
		player:setVar("mission_status",3);
		player:startEvent(Event(0x44));
	elseif (mobsup == 0) then
		loc = Zone(0xC2);
		loc:spawnMob("JackofBatons",-291.3, 0, -656.6,128,nil);
		loc:spawnMob("JackofSwords",-291.3, 0, -658.8,128,nil);
		loc:spawnMob("JackofCoins",-291.3, 0, -661,128,nil);
		loc:spawnMob("JackofCups",-291.3, 0, -663.2,128,nil);
		setGlobalVar("Windy_6_1_Fight",4)
		player:specialMessage(14); -- "A GUARDIAN IS BLOCKING YOUR WAY!"
	else	
		-- door should probably become untargetable while mobs are up.
  end;
else
	player:specialMessage(MISSIONS - 1) -- "the door is firmly shut."
end;

end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;