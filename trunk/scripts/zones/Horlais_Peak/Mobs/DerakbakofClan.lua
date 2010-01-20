-- Derakbak of Clan Wolf
-- by ReaperX
-- BCNM mob in Sandy Mission 7-2

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
--print("spawning..");
end;


function OnMobDeath(mob, player)
  mobsup = getGlobalVar("HORLAIS_PEAK");
  setGlobalVar("HORLAIS_PEAK",mobsup - 1);
  if (mobsup == 1) then
   player:addKeyItem(CrystalDowser);
   player:setVar("mission_status",2);
   event = Event(0x7D01);
   time = os.time()-getGlobalVar("HORLAIS_ENTER_TIME");
   record = getGlobalVar("SANDY_7_2_MISSION_RECORD");
   if (record == 0) then 
	 	record = time + 1;
	 end;
	 if (time < record) then
	 	setGlobalVar("SANDY_7_2_MISSION_RECORD",time);
	 end;	
	 setGlobalVar("HORLAIS_ENTER_TIME",0);
-- param 2: #time record for this mission
-- param 4: #clear time in seconds
-- param 6: #which mission (linear numbering as above)
-- param 7: 1: offer skip event menu 
-- one of the 1s switches the skip event menu.
	 event:setParams(0,record,0,time,0,3,1);
	 player:startEvent(event);
  end;
end;