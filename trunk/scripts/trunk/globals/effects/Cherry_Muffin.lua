-----------------------------------
--	Author: Psy aka psyclosis
--  Cherry muffin
--	A tiny cake filled with Yagudo cherries
--
--	http://wiki.ffxiclopedia.org/wiki/Cherry_Muffin
-- 
-- 30 min, All Races
-- MP  +10%(cap 80@825 base MP)
-- Intelligence +1
-- Agility -1
-----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,10);
	effect:addMod(MOD_FOOD_MP_CAP,80);
	effect:addMod(MOD_INT,1);
	effect:subtractMod(MOD_AGI,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
