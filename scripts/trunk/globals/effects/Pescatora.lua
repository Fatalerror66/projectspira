-----------------------------------
--	Author: Bababooey
--	Pescatora
--	Fishermen the world over salivate over this delectable blend of pomodoro
--	sauce and seafood served over spaghetti al dente.
--
--	http://wiki.ffxiclopedia.org/wiki/Pescatora
--
--	30 Minutes, All Races
--	Vitality +3
--	Mind -1
--	HP +15% (Cap: 150@1000 Base HP)
--	Defense +22% (Cap: 65@295 Base Defense)
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_HPP,15);
	effect:addMod(MOD_FOOD_HP_CAP,150);
	effect:addMod(MOD_FOOD_DEFP,22);
	effect:addMod(MOD_FOOD_DEF_CAP,65);
	effect:addMod(MOD_STORETP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

