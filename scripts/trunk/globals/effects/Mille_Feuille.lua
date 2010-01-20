----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Mille Feuille
--
--	A Windurstian cake made by stacking
--  thin slices of pie crust to symbolize
--  the leaves of the Great Star Tree  
--  
--  http://wiki.ffxiclopedia.org/wiki/Mille_Feuille
--
--  3 hours, All Races
--  Group Effects
--  HP Recovered while healing +1
--  MP Recovered while healing +1
--  HP +8
--  MP +15
--  INT +1
----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_HP,8);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
