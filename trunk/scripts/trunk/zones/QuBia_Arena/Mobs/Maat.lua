-- Maat
-- by ReaperX
-- For Limitbreak fights

require("scripts/globals/settings");
require("scripts/globals/rankpoints");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)

	--print(mob:getName());

end;

function OnMobDeath(mob, player)
  --print("Maat dead");
  player:showText(mob,1386); -- Hm. That was a mighty fine display of skill there, {Player Name}. You've come a long way...
  mobsup = getGlobalVar("QUBIA_ARENA");
  setGlobalVar("QUBIA_ARENA",mobsup - 1);
  if (mobsup == 1) then
   event = Event(0x7D01);
   time = os.time()-getGlobalVar("QUBIA_ENTER_TIME");
   bc = player:getVar("qubia_option");
   if (bc == 5) then
   	record = getGlobalVar("SHATTERING_STARS_PLD_RECORD");
   elseif (bc == 6) then
   	record = getGlobalVar("SHATTERING_STARS_DRK_RECORD");
   elseif (bc == 7) then
   	record = getGlobalVar("SHATTERING_STARS_BRD_RECORD");
   end;
	 if (record == 0) then 
	 	record = time + 1;
	 end;
	 if (time < record) then
	 	if (bc == 5) then
   		setGlobalVar("SHATTERING_STARS_PLD_RECORD",time);
   	elseif (bc == 6) then
	   	setGlobalVar("SHATTERING_STARS_DRK_RECORD",time);
   	elseif (bc == 7) then
   		setGlobalVar("SHATTERING_STARS_BRD_RECORD",time);
   	end;
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