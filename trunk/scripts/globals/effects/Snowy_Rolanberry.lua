-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Snowy Rolanberry
--
--	This icecap rolanberry is exceptionally delicious. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Snowy_Rolanberry
--  4 hrs, All Races
--  INT +2
--  MP +18%(cap:60@~333 BASE MP)
--  Wind Resist +5
--------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_MPP,18);
	effect:addMod(MOD_FOOD_MP_CAP,60);
	effect:addMod(MOD_WINDRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
