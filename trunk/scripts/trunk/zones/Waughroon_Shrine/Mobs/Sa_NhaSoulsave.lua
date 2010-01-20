-- Sa'Nha Soulsaver 
-- by ReaperX
-- BCNM mob in Bastok mission 7-2.

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)

	--print(mob:getName());

end;

function OnMobDeath(mob, killer)
	
	--mob:OnMobDeath(mob, killer, 1);
  mobsup = getGlobalVar("WAUGHROON_SHRINE");
  setGlobalVar("WAUGHROON_SHRINE",mobsup - 1);
  if (mobsup == 1) then
   killer:setVar("mission_status",4);
	 killer:addKeyItem(LetterFromWerei);
   event = Event(0x7D01);
   time = os.time()-getGlobalVar("WAUGHROON_ENTER_TIME");
   record = getGlobalVar("WAUGHROON_BASTOK7_2_RECORD");
   --print(time,record);
	 if (time < record) or (record == 0) then
	 	setGlobalVar("WAUGHROON_BASTOK7_2_RECORD",time);
	 end;	
	 setGlobalVar("WAUGHROON_ENTER_TIME",0);
-- param 2: #time record for this mission
-- param 4: #clear time in seconds
-- param 6: #which mission (linear numbering as above)
-- param 7: 1: offer skip event menu 
	 event:setParams(0,record,0,time,0,3,1);
	 killer:startEvent(event);
  end;
end;