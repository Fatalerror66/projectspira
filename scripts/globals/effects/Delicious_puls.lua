-----------------------------------
--	Author: Bababooey
-- 	Delicious Puls
-- 	This puls has been boiled to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Delicious_Puls
--
--	4 Hours, All Races
--	Vitality +3
--	Dexterity -1
--	HP Recovered while healing +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_HPHEAL,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
