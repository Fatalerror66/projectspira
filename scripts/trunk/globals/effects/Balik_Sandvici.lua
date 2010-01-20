-----------------------------------
--	Author: Bababooey
--	Balik Sandvici
--	Uskumru meat sandwiched between two slices of white bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Balik_Sandvici
--
--	30 Minutes, All Races
--	Dexterity +3
--	Agility +1
--	Mind -2
--	Intelligence +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_INT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
