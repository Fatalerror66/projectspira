-----------------------------------
--	Author: Bababooey
-- 	Menemen
-- 	This fluffy omelette is fit for the Empress's table. 
-- 
--	http://wiki.ffxiclopedia.org/wiki/Menemen_%2B1
--
--	4 Hours, All Races
--	HP +35
--  MP +35
--	Agility +2
--	Intelligence -2
--  HP Recovered while healing +2
--	MP Recovered while healing +2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,35);
	effect:addMod(MOD_MP,35);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
