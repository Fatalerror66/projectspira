-----------------------------------
--	Author: Bababooey
--  Optical Soup (effect)
--	This eyeball soup is so fresh, the eyeballs are still blinking.
--
--	http://wiki.ffxiclopedia.org/wiki/Optical_Soup
--
--	4 Hours All Races
--	HP +6% (Cap: 75@1250 Base HP)
--  Charisma -15
--  HP Recovered while healing +5
--  Accuracy +15
--  Ranged Accuracy +15
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_HP_CAP,75);
	effect:subtractMod(MOD_CHR,15);
	effect:addMod(MOD_HPHEAL,5);
	effect:addMod(MOD_ACC,15);
	effect:addMod(MOD_RACC,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
