-----------------------------------
--	Author: Bababooey
--	Anchovy Pizza
--	An often slighted pizza varietal that
--	makes up for its lack of adherents
--	with lots of salt.
--
--	http://wiki.ffxiclopedia.org/wiki/Anchovy_Pizza
--
--	3 Hours, All Races
--	Dexterity +1
--	Attack +20% (Cap: ???)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_ATTP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

