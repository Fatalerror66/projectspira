-- Sureshot Snatgat
-- by ReaperX
-- BCNM mob in Sandy mission 1-3

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)

	--print(mob:getName());

end;

function OnMobDeath(mob, killer)
	mobsup = getGlobalVar("GHELSBA_HUT");
	setGlobalVar("GHELSBA_HUT",mobsup - 1);
	if (mobsup == 1) then
		killer:setVar("mission_status",3);
		killer:addKeyItem(OrcishHutKey);
 		time = os.time()-getGlobalVar("GHELSBA_ENTER_TIME");
 		record = getGlobalVar("GHELSBA_SANDY_1_3_RECORD");
 		--print(time,record);
		if (time < record) or (record == 0) then
			setGlobalVar("GHELSBA_SANDY_1_3_RECORD",time);
		end;	
		setGlobalVar("GHELSBA_ENTER_TIME",0);
		-- param 2: #time record for this mission
		-- param 4: #clear time in seconds
		-- param 6: #which mission
		-- param 7: 1: offer skip event menu 
		event = Event(0x7D01);
		event:setParams(0,record,0,time,0,0,1,0);
		killer:startEvent(event);
  end;
end;