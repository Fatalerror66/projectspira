-----------------------------------
--	Author: Psy aka psyclosis
--  Rolanberry pie +1
--	One of the most delicious rolanberry pies you have ever tasted.
--
--	http://wiki.ffxiclopedia.org/wiki/Rolanberry_Pie_+1
-- 
-- 60 minutes, All Races
-- MP +60
-- Intelligence +3
-- HP Recovered While Healing +1
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,60);
	effect:addMod(MOD_INT,3);
	effect:addMod(MOD_HPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
