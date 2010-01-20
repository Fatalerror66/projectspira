-- Dread Dragon
-- by ReaperX
-- BCNM mob in Windurst and Bastok missions 2-3 

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
require("scripts/zones/Horlais_Peak/TextIDs");

DreadDragonSlayer = 3;

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
	mobsup = getGlobalVar("HORLAIS_PEAK");
	setGlobalVar("HORLAIS_PEAK",mobsup - 1);
	killer:setTitle(DreadDragonSlayer);
	if (mobsup == 1) then
		killer:setVar("mission_status",19);
		timeElapsed = os.time() - getGlobalVar("HORLAIS_ENTER_TIME");
		killer:addKeyItem(KindredCrest);
		killer:specialMessage(KEYITEM_OBTAINED,KindredCrest); -- temp fix
		event = Event(0x7D01);
		record = getGlobalVar("HORLAIS_RANK2_MISSION_RECORD");
		if (timeElapsed < record) then
			setGlobalVar("HORLAIS_RANK2_MISSION_RECORD",timeElapsed);
		end	 
		setGlobalVar("HORLAIS_ENTER_TIME",0);
	-- param 2: #time record for this mission
	-- param 4: #clear time in seconds
	-- param 6: #which mission (linear numbering as above)
	-- param 7: 1: offer skip event menu 
		 event:setParams(0,record,0,timeElapsed,0,0,1);
		 killer:startEvent(event);
	end
end;

function onEventFinish(player,csid,option) -- this isn't being called
if (csid == 0x7D01) then
	player:addKeyItem(KindredCrest);
	player:specialMessage(KEYITEM_OBTAINED,KindredCrest);
end;
end;
