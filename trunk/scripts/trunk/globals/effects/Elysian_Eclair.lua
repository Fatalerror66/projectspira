----------------------------------
--	Author: Psy aka psyclosis
--
--  Serving of Elysian Eclair
--
--	A serving of mille feuille
--  baked to perfection using the
--  skills of a patissier.   
--  
--  http://wiki.ffxiclopedia.org/wiki/Elysian_Eclair
--
--  4 hours, All Races
--  Group Effects
--  HP Recovered while healing +2
--  MP Recovered while healing +2
--  HP +10
--  MP +15
--  INT +2
--------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_INT,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
