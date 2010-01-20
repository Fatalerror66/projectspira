-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Flurry Courante
--
--	Made by a master patissier, the taste
--  of this gleaming icecap rolanberry
--  will make you dance with joy.  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Flurry_Courante
--  4 hrs, All Races
--  INT +2
--  MP +19%(cap:65@~342 BASE MP)
--  Wind Resist +5
--  MP Recovered while healing +1
--------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_MPP,19);
	effect:addMod(MOD_FOOD_MP_CAP,65);
	effect:addMod(MOD_WINDRES,5);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
