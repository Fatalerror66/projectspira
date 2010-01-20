-----------------------------------
--	Author: Bababooey
--	Cotton Tofu
--	A soft food made in the Far East by drying soy milk
--	atop squares of cotton cloth.
--
--	http://wiki.ffxiclopedia.org/wiki/Cotton_Tofu
--
--	5 Minutes, All Races
--	HP +10% (Cap: 30)
--	MP +10% (Cap: 30)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,10);
	effect:addMod(MOD_FOOD_HP_CAP,30);
	effect:addMod(MOD_FOOD_MPP,10);
	effect:addMod(MOD_FOOD_MP_CAP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
