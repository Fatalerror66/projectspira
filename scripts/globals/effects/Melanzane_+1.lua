-----------------------------------
--	Author: Bababooey
--	Melanzane +1
--	Made from the most exceptional eggplants in all of Vana'diel.
--
--	http://wiki.ffxiclopedia.org/wiki/Melanzane_%2B1
--
--	60 Minutes, All Races
--	Vitality +2
--	HP +25% (Cap: 105@420 Base HP)
--	Store TP +4
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_HPP,25);
	effect:addMod(MOD_FOOD_HP_CAP,105);
	effect:addMod(MOD_STORETP,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

