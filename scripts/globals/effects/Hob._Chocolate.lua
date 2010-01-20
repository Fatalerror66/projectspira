-----------------------------------
--	Author: Psy aka psyclosis
--  Chunk of Hobgoblin chocolate
--	This Goblin chocolate is especially bitter. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hobgoblin_Chocolate
-- 
--  5 minutes, All Races
--  MP Recovered while healing +7
--  Lizard Killer
--  Resist Petrify
-----------------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,7);
	effect:addMod(MOD_PETRIFYRES,5);
	effect:addMod(MOD_LIZARD_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
