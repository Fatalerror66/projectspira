-----------------------------------
--	Author: Bababooey
--	Choco-delight
--	The smooth, rich, and creamy flavor of this beverage puts regular chocomilk to shame.
--
--	http://wiki.ffxiclopedia.org/wiki/Choco-delight
--
--	4 Hours, All Races
--	MP Recovered while healing +5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
