-----------------------------------
--	Author: Bababooey
--	Boscaiola
--	Popular among lumberjacks, this flavorful pasta is made from a
--	tomato and mushroom sauce.
--
--	http://wiki.ffxiclopedia.org/wiki/Boscaiola
--
--	30 Minutes, All Races
--	Strength -5
--	Dexterity -2
--	Vitality +2
--	Mind +4
--	MP Recovered while healing +1
--	HP +18% (Cap: 120@666 Base HP)
--	MP +35
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,5);
	effect:subtractMod(MOD_DEX,2);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_MND,4);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_FOOD_HPP,18);
	effect:addMod(MOD_FOOD_HP_CAP,120);
	effect:addMod(MOD_MP,35);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

