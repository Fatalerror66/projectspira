-----------------------------------
--	Author: ReaperX
-- 	G-6 ??? for Bastok Mission 9.1 "The Salt of the Earth"
--  spawns NM Gigaplasm. Offspring spawns correctly, but winning by depopping
--  some of the offspring is not yet supported.
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
require("scripts/zones/Gustav_Tunnel/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Bastok_9_1_Fight");                           -- how many 9-1 NMs are currently up
timesincelastclear = os.time()-getGlobalVar("Bastok_9_1_LastClear"); -- how long ago they were last killed.

if (player:getMissionStatus(1,22) == 1) and (mission_status == 3) then
	if (timesincelastclear < QM_RESET_TIME) then
	  player:addKeyItem(MiracleSalt);
    player:specialMessage(KEYITEM_OBTAINED,MiracleSalt); 
    player:setVar("mission_status",4);
	elseif (mobsup == 0) then
	  loc = Zone(0xd4);
		loc:spawnMob("Gigaplasm",-128, 1.1, 255,69,player:getId());
	  setGlobalVar("Bastok_9_1_Fight",1)
	  player:specialMessage(1018);  -- you have a bad feeling about this place
  else
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(215); -- there is nothing out of the ordinary here.
end;
if (player:getMissionStatus(1,22) == 1) and (mission_status == 4) and (DEBUG_MODE) then
  player:setPos(5, 8, 77, 215, 0xF7);     -- to Rabao
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