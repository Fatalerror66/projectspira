-----------------------------------
--	Author: Bababooey
--	Pescatora +1
--	3 1/2 times better than the spaghetti pescatora your mom used to make.
--
--	http://wiki.ffxiclopedia.org/wiki/Pescatora_%2B1
--
--	60 Minutes, All Races
--	Vitality +3
--	Mind +1
--	HP +15% (Cap: 160@1066 Base HP)
--	Defense +22% (Cap: 70@318 Base Defense)
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_HPP,15);
	effect:addMod(MOD_FOOD_HP_CAP,160);
	effect:addMod(MOD_FOOD_DEFP,22);
	effect:addMod(MOD_FOOD_DEF_CAP,70);
	effect:addMod(MOD_STORETP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

