-----------------------------------
--	Author: Bababooey
-- 	Menemen
-- 	This Near Eastern omelette is packed with nutritious value.
-- 
--	http://wiki.ffxiclopedia.org/wiki/Menemen
--
--	3 Hours, All Races
--	HP +30
--  MP +30
--	Agility +1
--	Intelligence -1
--  HP Recovered while healing +1
--	MP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_MP,30);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
