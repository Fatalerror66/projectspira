-----------------------------------
--	Author: Bababooey
-- 	Humpty Soup
-- 	This egg soup is truly delicious. 
--
--	http://wiki.ffxiclopedia.org/wiki/Humpty_Soup
--
--	4 Hours, All Races
--	HP +5.5% (Cap: 35@636 Base HP)
--	MP +5
--	HP Recovered while healing +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_HP_CAP,35);
	effect:addMod(MOD_MP,5);
	effect:addMod(MOD_HPHEAL,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
