-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of bavarois +1
--	A bavarois among bavarois. Using the finest ripe 
-- fruits, this dish is chilled to the perfect consistency.
--
--	http://wiki.ffxiclopedia.org/wiki/Bavarois_%2B1
-- 
-- 4 Hours, All Races
-- HP +25
-- Intelligence +4
-----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_INT,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
