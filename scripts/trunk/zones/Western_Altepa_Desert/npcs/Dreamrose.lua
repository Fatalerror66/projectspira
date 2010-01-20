-----------------------------------
--	Author: ReaperX
--  Dreamrose
--  for Sandy Mission 6-1 -- spawns NM Sabotender Enamorado. 
--  approximate pop position verified from 
--  http://www.xfire.com/video/a076d/ 
---------------------------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
require("scripts/zones/Western_Altepa_Desert/TextIDs");
---------------------------------------------------

function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Sandy_6_1_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Sandy_6_1_LastClear"); -- how long ago they were last killed.

if (player:hasKeyItem(Dreamrose) == 1) and (DEBUG_MODE) then
  player:setPos(1, 0, -6, 200, 0xE9);	-- back to Halver
end;

if (player:getMissionStatus(0,16) == 1) and (mission_status == 3) then
	
	if (timesincelastclear < QM_RESET_TIME) then
		player:addKeyItem(Dreamrose);
		player:specialMessage(KEYITEM_OBTAINED, Dreamrose);
		player:setVar("mission_status",4);
	elseif (mobsup == 0) then
    player:specialMessage(MISSION_OFFSET+4); -- "You feel something prickly"
    loc = Zone(0x7D);
	  loc:spawnMob("SabotenderEnam",-261, -10, 49,156,player:getId());
	  setGlobalVar("Sandy_6_1_Fight",1)
  else	
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(MISSION_OFFSET+3); -- "It is a beautiful desert flower."
end;
end; 