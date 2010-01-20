-----------------------------------
--	Author: Bababooey
--	Shrimp Cracker +1
--	If you like shrimp, then you'll love this flavorful shrimp cracker.
--
--	http://wiki.ffxiclopedia.org/wiki/Shrimp_Cracker_%2B1
--
--	5 Minutes, All Races
--	Vitality +2
--	HP Recovered while healing +9
--	Amorph Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_HPHEAL,9);
	effect:addMod(MOD_AMORPH_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
