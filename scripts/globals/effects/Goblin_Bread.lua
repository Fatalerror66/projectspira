-----------------------------------
--	Author: Bababooey
--	Goblin Bread
--	The Goblins make this hard bread from horo barley flour.
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Bread
--
--	30 Minutes, All Races
--	Vitality +1
--	Charisma -5
--	HP +7
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,1);
	effect:subtractMod(MOD_CHR,5);
	effect:addMod(MOD_HP,7);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

