-----------------------------------
--	Author: Bababooey
-- 	Hobgoblin Pie
-- 	This strangely baked Goblin pie looks burnt in some places. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hobgoblin_Pie
--	
--	60 Minutes, All Races
--	HP +15
--	MP +15
--	Agility +4
--	Charisma -7
--	Defense +11% (Cap 60@545 Base Defense)
--	HP Recovered while healing +2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,15);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_AGI,4);
	effect:subtractMod(MOD_CHR,7);
	effect:addMod(MOD_FOOD_DEFP,9);
	effect:addMod(MOD_FOOD_DEF_CAP,60);
	effect:addMod(MOD_HPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
