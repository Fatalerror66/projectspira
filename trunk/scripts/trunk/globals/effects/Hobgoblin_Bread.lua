-----------------------------------
--	Author: Bababooey
--	Hobgoblin Bread
--	This strangely baked Goblin bread looks burnt in some places.
--
--	http://wiki.ffxiclopedia.org/wiki/Hobgoblin_Bread
--
--	60 Minutes, All Races
--	Vitality +3
--	Charisma -7
--	HP Recovered while healing +2
--	HP +10
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_CHR,7);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_HP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

