require("/scripts/globals/common");
require("/scripts/globals/settings");

ZONE_ID = 0xAE;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------


---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
-- Kuftal Tunnel coffer anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
--print("Kuftal Tunnel coffers illusion time reset.");
setGlobalVar("Bastok_8_2_Fight",0); 													 -- mission NMs are unpopped by default.
setGlobalVar("Bastok_8_2_LastClear", os.time()-QM_RESET_TIME); -- 8-2 ??? is set to spawn NMs by default.
end;