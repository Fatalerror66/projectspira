-- BlackDragon
-- by ReaperX
-- BCNM mob in Windurst and Bastok missions 2-3 

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

BlackDragonSlayer = 7;

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
	
	--mob:OnMobDeath(mob, killer, 1);
	mobsup = getGlobalVar("BALGAS_DAIS");
	setGlobalVar("BALGAS_DAIS",mobsup - 1);
	killer:setTitle(BlackDragonSlayer);
if (mobsup == 1) then
	killer:setVar("mission_status",9);
	killer:removeKeyItem(DarkKey);
	killer:addKeyItem(KindredCrest);
	timeElapsed = os.time() - getGlobalVar("BALGAS_ENTER_TIME");
	event = Event(0x7D01);
	record = getGlobalVar("BALGAS_RANK2_MISSION_RECORD");
	if (timeElapsed < record) then
		setGlobalVar("BALGAS_RANK2_MISSION_RECORD",timeElapsed);
	end	 
	setGlobalVar("BALGAS_ENTER_TIME",0);
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
	player:specialMessage(23,KindredCrest);
end;
end;
