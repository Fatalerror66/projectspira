-----------------------------------
--	Author: Psyclosis
--	CELESTIAL AVATAR: Garuda Prime
--	Fights players in the battlefield "Trial by Wind."
--  Thanks Tenjou for template
--	Thanks ReaperX for all the research detailed below!
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
	timeElapsed = os.time() - getGlobalVar("TRIAL_BY_WIND_ENTER_TIME");
	event = Event(0x7D01);
	record = getGlobalVar("TRIAL_BY_WIND_RECORD");
	if (timeElapsed < record) then
		setGlobalVar("TRIAL_BY_WIND_RECORD",timeElapsed);
	end	 
	setGlobalVar("TRIAL_BY_WIND_ENTER_TIME",0);
	-- param 2: #time record for this mission
	-- param 4: #clear time in seconds
	-- param 6: #which mission (linear numbering as above)
	-- param 7: 1: offer skip event menu 
	 event:setParams(0,record,0,timeElapsed,0,0,1);
	 killer:startEvent(event);
end;

function onEventFinish(player,csid,option)
end;
