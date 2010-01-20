-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of squirrel's delight
--
--	Made by a master patissier,
--  this gleaming marron glace is sure
--  to delight anyone who takes a bite. 
--
--	http://wiki.ffxiclopedia.org/wiki/Squirrel%27s_Delight
-- 
--  4 hours, All Races
--  MP +13% (Cap: 95@731 Base MP)	
--  MP Recovered While Healing +2
----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,13);
	effect:addMod(MOD_FOOD_MP_CAP,95);
	effect:addMod(MOD_MPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
