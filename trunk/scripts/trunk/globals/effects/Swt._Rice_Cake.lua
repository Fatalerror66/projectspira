-----------------------------------
--	Author: Psy aka psyclosis
--  Sweet Rice Cake
--
--	This three-layered rice cake has been
--  molded into a diamond shape. The
--  coloring used in the layers has
--  medicinal properties.   
-- 
--  http://wiki.ffxiclopedia.org/wiki/Sweet_Rice_Cake
--  30 min, All Races
--  MP Recovered while healing +2
--  HP Recovered while healing +2
--  Mind +1
--  Vitality +2
--  MP +17
--  Intelligence +3
--  Evasion +5
--  Resist Silence
-------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_MND,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_INT,3);
	effect:addMod(MOD_EVA,5);
	effect:addMod(MOD_SILENCERES,5);
	effect:addMod(MOD_MP,17);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
