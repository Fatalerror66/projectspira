-----------------------------------
--	Author: Bababooey
--	Land Crab Meat
--	Land crab meat is known for its tenderness.
--
--	http://wiki.ffxiclopedia.org/wiki/Land_Crab_Meat
--
--	5 Minutes, All Races
--	Dexterity -4
--	Vitality +3
--	Defense +15% (Cap: ???)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_DEX,4);
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_FOOD_DEFP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

