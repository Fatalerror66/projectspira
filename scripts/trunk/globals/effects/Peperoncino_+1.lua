-----------------------------------
--	Author: Bababooey
--	Peperoncino +1
--	This spaghetti peperoncino is so hot, you will need at least Water IV to
--	cool off the fire in your mouth.
--
--	http://wiki.ffxiclopedia.org/wiki/Peperoncino_%2B1
--
--	60 Minutes, All Races
--	Vitality +2
--	HP +30% (Cap: 75@250 Base HP)
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_HPP,30);
	effect:addMod(MOD_FOOD_HP_CAP,75);
	effect:addMod(MOD_STORETP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

