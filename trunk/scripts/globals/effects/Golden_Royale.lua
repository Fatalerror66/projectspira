----------------------------------
--	Author: Psy aka psyclosis
--  Serving of golden royale
--
--	A serving of mont blanc baked to perfection 
--  using the skills of a patissier.  
--  
--  http://wiki.ffxiclopedia.org/wiki/Golden_Royale
--
--  4 hours, All Races
--  Group Effects
--  HP Recovered while healing +2
--  MP Recovered while healing +2
--  HP +10
--  MP +10
--  INT +2
----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_INT,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
