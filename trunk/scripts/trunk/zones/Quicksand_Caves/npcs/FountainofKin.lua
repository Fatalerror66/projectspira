-----------------------------------
--  Fountain of Kings @ pos 566 18 -939 in the Quicksand Caves
--	Author: ReaperX
-- 	For Sandy mission 8-2, pops NMs Honor and Valor
-- 
--  NMs pop underwater, precise pop positions are unverified. Pop
--  message unverified, but likely correct based on the position of
--  the text ID.

-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Sandy_8_1_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Sandy_8_1_LastClear"); -- how long ago they were last killed.

if (player:hasKeyItem(DropsOfAmnio) == 1) and (DEBUG_MODE) then
  player:setPos(1, 0, -6, 200, 0xE9);	-- to Halver
end;
if (player:getMissionStatus(0,20) == 1) and (mission_status == 3) then
	--print("on mission 8-1");
	if (timesincelastclear < QM_RESET_TIME) then
		player:addKeyItem(DropsOfAmnio);
		player:specialMessage(KEYITEM_OBTAINED, DropsOfAmnio);
		player:setVar("mission_status",4);
	elseif (mobsup == 0) then
    player:specialMessage(MISSION_OFFSET+1); -- "You sense something evil."
	  loc = Zone(0xd0);
		loc:spawnMob("Honor",575.5, 22.6, -933,130,nil);
		loc:spawnMob("Valor",575.5, 22.6, -946,143,nil);
	  setGlobalVar("Sandy_8_1_Fight",2)
  else	
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(MISSION_OFFSET); -- "It is a pool of water."
end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;