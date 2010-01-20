-----------------------------------
--	Author: Bababooey
--	Shrimp Cracker
--	A traditional rice cracker from a land far to the east.
--
--	http://wiki.ffxiclopedia.org/wiki/Shrimp_Cracker
--
--	3 Minutes, All Races
--	Vitality +1
--	HP Recovered while healing +8
--	Amorph Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_HPHEAL,8);
	effect:addMod(MOD_AMORPH_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
