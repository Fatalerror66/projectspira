-- Buu Xolo the Bloodfaced
-- by ReaperX
-- BCNM mob in Windurst Mission 6-2

require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
require("scripts/zones/Balgas_Dais/TextIDs");


-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, player)
	mobsup = getGlobalVar("BALGAS_DAIS");
	setGlobalVar("BALGAS_DAIS",mobsup - 1);
	if (mobsup == 1) then
		player:setVar("mission_status",3);
		player:addKeyItem(BalgaChampionCertificate);
		player:specialMessage(KEYITEM_OBTAINED,BalgaChampionCertificate);
		player:setTitle(VictorOfTheBalgaContest)
		player:removeKeyItem(HolyOnesInvitation);
		event = Event(0x7D01);
		time = os.time()-getGlobalVar("BALGAS_ENTER_TIME");
		record = getGlobalVar("BALGAS_SAINTLY_INVITATION_RECORD");
		if (time < record) then
			setGlobalVar("BALGAS_SAINTLY_INVITATION_RECORD",time);
		end;	
		setGlobalVar("BALGAS_ENTER_TIME",0);
		-- param 2: #time record for this mission
		-- param 4: #clear time in seconds
		-- param 6: #which mission (linear numbering as above)
		-- param 7: 1: offer skip event menu 
		-- one of the 1s switches the skip event menu.
		event:setParams(0,record,0,time,0,3,1);
		player:startEvent(event);
	end;
end;