-- Ace of Batons
-- by ReaperX
-- BCNM mob in Bastok mission 9-2

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, player)
	mobsup = getGlobalVar("FULL_MOON_FOUNTAIN");
	setGlobalVar("FULL_MOON_FOUNTAIN",mobsup - 1);
	if (mobsup == 1) then
		event = Event(0x7D01);
		time = os.time()-getGlobalVar("FMF_ENTER_TIME");
		record = getGlobalVar("WAUGHROON_BASTOK7_2_RECORD");
		if (time < record) or (record == 0) then
			setGlobalVar("FMF_WINDURST_9_2_RECORD",time);
		end;	
		player:setVar("mission_status",4);
		setGlobalVar("FMF_ENTER_TIME",0);
		-- param 2: #time record for this mission
		-- param 4: #clear time in seconds
		-- param 6: #which mission (linear numbering as above)
		-- param 7: 1: offer skip event menu 
		event:setParams(0,record,0,time,0,1,1);
		player:startEvent(event);
	end;
end;