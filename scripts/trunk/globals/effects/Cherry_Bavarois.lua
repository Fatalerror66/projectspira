-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of cherry bavarois
--	A delectable cherry cream thickened
--  with gelatin, then chilled and molded
--  into a scrumptious dessert. 
--
--	http://wiki.ffxiclopedia.org/wiki/Cherry_Bavarois
-- 
-- 3 Hours, All Races
-- HP +25
-- Intelligence +3
-- MP +10
-- HP Recovered while healing +3
-----------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_INT,3);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_HPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
