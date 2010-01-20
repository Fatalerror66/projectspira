-----------------------------------
--	Author: ReaperX
-- 	H-8 ??? down below for Bastok Mission 8.2 "Enter the Talekeeper"
--  spawns NMs
--  Dervo's Ghost, Gizerl's Ghost, Gordov's Ghost 
--  pop positions are not authentic.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------  
mission_status = player:getVar("mission_status");

mobsup = getGlobalVar("Bastok_8_2_Fight");                           -- how many 8-2 NMs are currently up
timesincelastclear = os.time()-getGlobalVar("Bastok_8_2_LastClear"); -- how long ago they were last killed.

if (player:getMissionStatus(1,21) == 1) and (mission_status == 3) then
	if (timesincelastclear < QM_RESET_TIME) then
	  player:startEvent(Event(0x0D));
	elseif (mobsup == 0) then
    loc = Zone(0xAE);
	  loc:spawnMob("Dervo_sGhost",-23.3, -9.3, -183.8,100,nil);
	  loc:spawnMob("Gizerl_sGhost",-24.9, -9.3, -181,91,nil);
	  loc:spawnMob("Gordov_sGhost",-30.4, -11.5, -176.5,48,nil);
	  player:specialMessage(1075); -- you sense an evil presence..
	  setGlobalVar("Bastok_8_2_Fight",3)
  else
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(1070); -- there is nothing unusual about the sand here.
end;
if (player:getMissionStatus(1,21) == 1) and (mission_status == 4) and (DEBUG_MODE) then
  player:setPos(-71, 0, 60, 124, 0xAC);     -- to Drake Fang
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
if (csid == 0x0D) then
  player:setVar("mission_status",4);
  player:addKeyItem(OldPieceOfWood); -- old piece of wood
end
end;