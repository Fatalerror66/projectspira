-----------------------------------
--	Author: ReaperX
--  ??? (qm4)
--  for Sandy Mission 7-1, pops NM Marauder Dvogzog 
--  pop position verified from http://www.youtube.com/watch?v=yJhK4j-XBcc
--  and http://www.youtube.com/watch?v=ObSmyBvYxc0&feature=fvw .
--  The second video also shows the pop message "Something is Amiss".
---------------------------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
require("scripts/zones/West_Ronfaure/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Sandy_7_1_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Sandy_7_1_LastClear"); -- how long ago they were last killed.

if (player:hasKeyItem(AncientSandOrianTablet) == 1) and (DEBUG_MODE) then
  player:setPos(133, -11, 124, 100, 0xE7);	-- to Papal Chamber
end;

if (player:getMissionStatus(0,18) == 1) and (mission_status == 2) then
	if (timesincelastclear < QM_RESET_TIME) then
		player:addKeyItem(AncientSandOrianTablet);
		player:specialMessage(KEYITEM_OBTAINED, AncientSandOrianTablet);
		player:setVar("mission_status",4);
	elseif (mobsup == 0) then
		loc = Zone(0x64);
		loc:spawnMob("MarauderDvogzo",-695, -39, 17,192,player:getId());
		player:specialMessage(MISSION_OFFSET+1); -- "Something is amiss."
	  setGlobalVar("Sandy_7_1_Fight",1)
  else	
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(MISSION_OFFSET); -- "Something seems unnatural about the outcropping."
end;

end;