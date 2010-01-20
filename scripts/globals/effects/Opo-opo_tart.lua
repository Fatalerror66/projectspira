-----------------------------------
--	Author: Psy aka psyclosis
--  Opo Opo Tart
--	Even opo-opos cannot resist the delightful aroma of this 
--  titillating pamama tart.
--	http://wiki.ffxiclopedia.org/wiki/pamama_tart
-- 
-- 60 minutes, All Races
-- MP +12
-- Intelligence +4
-- HP +12
-- MP recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,12);
	effect:addMod(MOD_INT,4);
	effect:addMod(MOD_HP,12);
	effect:addMod(MOD_MPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
