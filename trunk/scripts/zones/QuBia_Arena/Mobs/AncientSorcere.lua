-- Ancient Sorcerer
-- by ReaperX
-- BCNM mob in Windurst and Bastok missions 2-3 

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;


function OnMobDeath(mob, player)
  mobsup = getGlobalVar("QUBIA_ARENA");
  setGlobalVar("QUBIA_ARENA",mobsup - 1);
  if (mobsup == 1) then
   player:addKeyItem(BurntSeal);
   player:removeKeyItem(NewFeiYinSeal);
   player:setVar("mission_status",4);
   event = Event(0x7D01);
   time = os.time()-getGlobalVar("QUBIA_ENTER_TIME");
   record = getGlobalVar("RANK5_MISSION_RECORD");
   if (record == 0) then 
	 	record = time + 1;
	 end;
	 if (time < record) then
	 	setGlobalVar("RANK5_MISSION_RECORD",time);
	 end;	
	 setGlobalVar("QUBIA_ENTER_TIME",0);
-- param 2: #time record for this mission
-- param 4: #clear time in seconds
-- param 6: #which mission (linear numbering as above)
-- param 7: 1: offer skip event menu 
-- one of the 1s switches the skip event menu.
	 event:setParams(0,record,0,time,0,0,1);
	 player:startEvent(event);
  end;
end;