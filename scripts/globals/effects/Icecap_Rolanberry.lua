-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Icecap Rolanberry
--
--	A white mousse dessert with
--  rolanberry topping. 
-- 
-- 3 hrs, All Races
-- INT +2
-- MP +19%(cap:55@~289 BASE MP)
-- Wind Resist +5
--------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_MPP,19);
	effect:addMod(MOD_FOOD_MP_CAP,55);
	effect:addMod(MOD_WINDRES,5);
	
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
