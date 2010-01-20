-----------------------------------
--	Author: Bababooey
--	Giant Sheep Meat
--	This mutton is a little tough.
--	Widely eaten on the Quon Continent.
--
--	http://wiki.ffxiclopedia.org/wiki/Giant_Sheep_Meat
--
--	5 Minutes, All Races
--	Strength +2
--	Intelligence -4
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,2);
	effect:subtractMod(MOD_INT,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

