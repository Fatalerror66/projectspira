-----------------------------------
--	Author: Bababooey
--	Tonno Rosso
--	A pasta dish made with tuna and tomato sauce.
--
--	http://wiki.ffxiclopedia.org/wiki/Tonno_Rosso
--
--	30 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	HP +13% (Cap: 180@1400 Base HP)
--	Store TP +5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_HPP,13);
	effect:addMod(MOD_FOOD_HP_CAP,180);
	effect:addMod(MOD_STORETP,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
