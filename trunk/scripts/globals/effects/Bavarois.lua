-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of bavarois
--	A delectable fruit cream thickened
--  with gelatin, then chilled and molded
--  into a scrumptious dessert.
--
--	http://wiki.ffxiclopedia.org/wiki/Bavarois
-- 
-- 3 Hours, All Races
-- HP +20
-- Intelligence +3
-----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_INT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
