-- Seeker
-- by ReaperX
-- BCNM mob in Windurst and Sandy missions 2-3 
-- problems: call back function is not being called (same for onEventFinish)

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil;
require("scripts/zones/Waughroon_Shrine/TextIDs");
-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)

	--print(mob:getName());

end;

function OnMobDeath(mob, killer)
	mobsup = getGlobalVar("WAUGHROON_SHRINE");
	setGlobalVar("WAUGHROON_SHRINE",mobsup - 1);
	if (mobsup == 1) then
		enter_time = getGlobalVar("WAUGHROON_ENTER_TIME");
		mission_status = killer:getVar("mission_status");
		killer:setVar("mission_status",mission_status + 1);
		killer:addKeyItem(KindredCrest); -- workaround
		killer:specialMessage(KEYITEM_OBTAINED,KindredCrest);
		event = Event(0x7D01);
		time = os.time()-enter_time;
		record = getGlobalVar("WAUGHROOM_RANK2_RECORD");
		if (time < record) or (record == 0) then
			setGlobalVar("WAUGHROOM_RANK2_RECORD",time);	
		end;	
		setGlobalVar("WAUGHROOM_ENTER_TIME",0);
		-- param 2: #time record for this mission
		-- param 4: #clear time in seconds
		-- param 6: #which mission (linear numbering as above)
		-- param 7: 1: offer skip event menu 
		-- one of the 1s switches the skip event menu.
		event:setParams(0,record,0,time,0,0,1);
		killer:startEvent(event);
	end;
end;

function onEventFinish(player,csid,option) -- this isn't being called
if (csid == 0x7D01) then
	player:specialMessage(KEYITEM_OBTAINED,KindredCrest);
end;
end;