-----------------------------------
--	Author: Bababooey
--	Tonno Rosso +1
--	An exceptionally delicious serving of spaghetti tonno rosso.
--
--	http://wiki.ffxiclopedia.org/wiki/Tonno_Rosso_%2B1
--
--	30 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	HP +13% (Cap: 185@1400 Base HP)
--	Store TP +5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_HPP,13);
	effect:addMod(MOD_FOOD_HP_CAP,185);
	effect:addMod(MOD_STORETP,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
