-----------------------------------
--	Author: ReaperX
-- 	??? for Bastok Mission 8.1 "The Chains That Bind Us"
-- 	spawns the NMs
--      * Triarius IV-XIV (Black Mage)
--      * Princeps IV-XLV (Paladin)
--			* Centurio IV-VII (Warrior) 
--
-- ??? message and pop locations are unverified.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Bastok_8_1_Fight");                           -- how many 8-1 NMs are currently up
timesincelastclear = os.time()-getGlobalVar("Bastok_8_1_LastClear"); -- how long ago they were last killed.

if (player:getMissionStatus(1,20) == 1) and (mission_status == 2) then
	if (timesincelastclear < QM_RESET_TIME) then
	  player:startEvent(Event(0x0B));
	elseif (mobsup == 0) then
    loc = Zone(0xd0);
	  loc:spawnMob("TriariusIV-XIV",-468, 0, 617.3,240,nil);
	  loc:spawnMob("PrincepsIV-XLV",-468, 0, 620.8,0,nil);
	  loc:spawnMob("CenturioIV-VII",-468, 0, 625.8,27,nil);
	  setGlobalVar("Bastok_8_1_Fight",3)
	  player:specialMessage(216); -- sense of foreboding 
  else
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(215); -- there is nothing out of the ordinary here.
end;
if (player:getMissionStatus(1,20) == 1) and (mission_status == 3) and (DEBUG_MODE) then
  player:setPos(-530, 0, -414, 113); -- to next ???
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
if (csid == 0x0B) then
  player:setVar("mission_status",3);
end
end;