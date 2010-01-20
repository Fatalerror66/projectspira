-----------------------------------
--	Author: Bababooey
-- 	Rattatouille +1
-- 	Marvelously stewed, masterfully seasoned, perfectly chilled ratatouille. 
--
--	http://wiki.ffxiclopedia.org/wiki/Ratatouille_%2B1
--	
--	4 Hours, All Races
--	Agility +5
--	Evasion +5
--	HP Recovered while healing +2
--	Undead Killer
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,5);
	effect:addMod(MOD_EVA,5);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_UNDEAD_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
