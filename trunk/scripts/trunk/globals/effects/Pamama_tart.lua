-----------------------------------
--	Author: Psy aka psyclosis
--  Pamama Tart
--	A round cake crust topped with plenty of pamamas.                
--
--	http://wiki.ffxiclopedia.org/wiki/pamama_tart
-- 
-- 30 minutes, All Races
-- MP +10
-- Intelligence +3
-- HP +10
-- Dexterity -1
-- MP recovered while healing +2
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_INT,3);
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_MPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
