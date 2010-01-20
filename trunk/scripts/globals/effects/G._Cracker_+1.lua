-----------------------------------
--	Author: Bababooey
--	Garlic Cracker +1
--	Now with 32% more garlic! Do not eat these potent crackers before a date.
--
--	http://wiki.ffxiclopedia.org/wiki/Garlic_Cracker_%2B1
--
--	5 Minutes, All Races
--	HP Recovered while healing +8
--	Resist Blind
--	Undead Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,8);
	effect:addMod(MOD_BLINDRES,5);
	effect:addMod(MOD_UNDEAD_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

