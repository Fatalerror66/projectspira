-----------------------------------
--	Author: Bababooey
--	Carp Sushi
--	A traditional fish dish from a land far to the east.
--
--	http://wiki.ffxiclopedia.org/wiki/Carp_Sushi
--
--	30 Minutes, All Races
--	Dexterity +1
--	HP Recovered while healing +2
--	Accuracy +10% (Cap: ???)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_ACCP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
