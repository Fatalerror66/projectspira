---------------------------------
-- Includes
---------------------------------
require("/scripts/globals/common");
require("/scripts/globals/settings");
---------------------------------
-- Initialization
---------------------------------
ZONE_ID = 0x95;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)cs = -1;

if (player:getMissionStatus(0,10) == 1) and (player:getVar("mission_status") == 2) then
  player:setVar("mission_status",3);
  cs = 0x74;
else
	cs = -1;
end;

return cs;
end;

---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
-- Davoi chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Davoi chest illusion time reset.");
---------------------------------
-- Poped NMs
setGlobalVar("[NM_Dead]Bilopdop",0);
setGlobalVar("[NM_Dead]Deloknok",0);
setGlobalVar("[NM_poped]Bilopdop_and_Deloknok",0);


--------------------------------
end;