-----------------------------------
--	Author: ReaperX
--  ???
--  for Bastok Mission 6-1 -- spawns NMs Eastern and Western Sphinx.
--  pop message verified to be "You sense something evil looming above you."
--  see http://www.youtube.com/watch?v=Nx0uIIEK3WY

---------------------------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
require("scripts/zones/Western_Altepa_Desert/TextIDs");
---------------------------------------------------

function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Bastok_6_1_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Bastok_6_1_LastClear"); -- how long ago they were last killed.

if (player:hasKeyItem(AltepaMoonpebble) == 1) and (DEBUG_MODE) then
  player:setPos(68, 7, -4, 52, 0xEA);	-- to Tall Mountain in Bastok Mines
end;

if (player:getMissionStatus(1,16) == 1) and (mission_status == 3) then
	if (timesincelastclear < QM_RESET_TIME) then
		player:addKeyItem(AltepaMoonpebble);
		player:specialMessage(KEYITEM_OBTAINED, AltepaMoonpebble);
		player:setVar("mission_status",4);
	elseif (mobsup == 0) then
    player:specialMessage(MISSION_OFFSET+1); -- "You sense something evil looming above you."
    loc = Zone(0x7D);
	  loc:spawnMob("EasternSphinx",-327.72, -3, -114.48,178,nil);
	  loc:spawnMob("WesternSphinx",-329.63, -4.18, -110.45,50,nil);
	  setGlobalVar("Bastok_6_1_Fight",2)
  else	
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(MISSION_OFFSET); -- "Many stones litter the area."
end;
end; 