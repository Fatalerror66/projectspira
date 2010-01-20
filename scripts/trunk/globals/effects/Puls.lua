-----------------------------------
--	Author: Bababooey
-- 	Puls
-- 	A porridge made from flour. 
--
--	http://wiki.ffxiclopedia.org/wiki/Puls
--
--	3 Hours, All Races
--	Vitality +2
--	Dexterity -1
--	HP Recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_HPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
