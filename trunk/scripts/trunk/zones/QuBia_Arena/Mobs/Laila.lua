-- Maat
-- by ReaperX
-- For Limitbreak fights

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)

	--print(mob:getName(), "spawned at coordinates",mob:getXPos(),mob:getYPos(),mob:getZPos());
 
end;

function OnMobDeath(mob, player)
  --print("Laila dead");
  mobsup = getGlobalVar("QUBIA_ARENA");
  setGlobalVar("QUBIA_ARENA",mobsup - 1);
  if (mobsup == 1) then
   event = Event(0x7D01);
   time = os.time()-getGlobalVar("QUBIA_ENTER_TIME");
   bc = player:getVar("qubia_option");
   record = getGlobalVar("SHATTERING_STARS_DNC_RECORD");
	 if (record == 0) then 
	 	record = time + 1;
	 end;
	 if (time < record) then
		setGlobalVar("SHATTERING_STARS_DNC_RECORD",time);
   end;
	 setGlobalVar("QUBIA_ENTER_TIME",0);
	-- param 2: #time record for this mission
	-- param 4: #clear time in seconds
	-- param 6: #which mission
	-- param 7: 1: offer skip event menu 
	 event:setParams(0,record,0,time,0,bc,1);
	 player:startEvent(event);
  end;
end;