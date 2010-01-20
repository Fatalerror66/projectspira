-----------------------------------
--	Author: Psy aka psyclosis
--  Chunk of Goblin chocolate
--	Chocolate made using special Goblin techniques. 
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Chocolate
-- 
-- 3 minutes, All Races
-- MP Recovered while healing +5
-- Lizard Killer
-- Resist Petrify
-----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,5);
	effect:addMod(MOD_LIZARD_KILLER,5);
	effect:addMod(MOD_PETRIFYRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
