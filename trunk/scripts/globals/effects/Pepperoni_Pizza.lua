-----------------------------------
--	Author: Bababooey
--	Pepperoni Pizza
--	A layer of pepperoni separates the cheese above from the sauce below. A
--	mainstay of any pizza repertoire.
--
--	http://wiki.ffxiclopedia.org/wiki/Pepperoni_Pizza
--
--	3 Hours, All Races
--	Strength +1
--	HP +30
--	Attack +5% (Cap: 15@331 Base Attack)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,1);
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_FOOD_ATTP,5);
	effect:addMod(MOD_FOOD_ATT_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

