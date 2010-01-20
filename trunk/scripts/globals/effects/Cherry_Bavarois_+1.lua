-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of cherry bavarois +1
--	The sweetest, ripest cherries have
--  been hand-picked to create a sublime
--  bavarois fit for emperors and kings. 
--
--	http://wiki.ffxiclopedia.org/wiki/Cherry_Bavarois_%2B1
-- 
-- 4 Hours, All Races
-- HP +30
-- Intelligence +4
-- MP +15
-- HP Recovered while healing +4
-----------------------------------


require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
	effect:addMod(MOD_INT,4);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_HPHEAL,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
