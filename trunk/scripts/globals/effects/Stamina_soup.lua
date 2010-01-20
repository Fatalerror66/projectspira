-----------------------------------
--	Author: Bababooey
-- 	Stamina Soup
-- 	This turtle soup puts most others to shame.
--
--	http://wiki.ffxiclopedia.org/wiki/Stamina_Soup
--
--	4 Hours, All Races
--	HP +10%
--	Dexterity +4
--	Vitality +6
--	Mind -3
--	HP Recovered while healing +10
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPP,10);
	effect:addMod(MOD_DEX,4);
	effect:addMod(MOD_VIT,6);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_HPHEAL,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
