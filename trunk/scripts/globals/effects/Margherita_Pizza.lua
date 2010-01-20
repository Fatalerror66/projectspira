-----------------------------------
--	Author: Bababooey
--	Margherita Pizza
--	This pizza derives its popularity from the tried-and-tested combinatorial
--	deliciousness of cheese, basil, and tomato.
--
--	http://wiki.ffxiclopedia.org/wiki/Margherita_Pizza
--
--	3 Hours, All Races
--	HP +30
--	Attack +10
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_ATT,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
