-----------------------------------
--	Author: Bababooey
--	Sunflower Seeds
--	These edible seeds are harvested from giant sunflowers.
--
--	http://wiki.ffxiclopedia.org/wiki/Sunflower_Seeds
--
--	5 Minutes, All Races
--	Dexterity -3
--	Intelligence +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_DEX,3);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

