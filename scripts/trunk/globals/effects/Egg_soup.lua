-----------------------------------
--	Author: Bababooey
-- 	Egg Soup
-- 	A soup made from eggs.
--
--	http://wiki.ffxiclopedia.org/wiki/Egg_Soup
--
--	3 Hours, All Races
--	HP +5.5% (Cap: 30@545 Base HP)
--	MP +5
--	HP Recovered while healing +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_HP_CAP,30);
	effect:addMod(MOD_MP,5);
	effect:addMod(MOD_HPHEAL,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
