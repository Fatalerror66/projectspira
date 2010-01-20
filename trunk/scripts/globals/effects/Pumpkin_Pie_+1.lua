-----------------------------------
--	Author: Psy aka psyclosis
--  Pumpkin Pie +1
--	A yummy pie made from ogre pumpkins.
--
--	http://wiki.ffxiclopedia.org/wiki/Pumpkin_Pie_+1
-- 
-- 60 minutes, All Races
-- MP +45
-- Intelligence +4
-- Charisma -1
-- MP recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,45);
	effect:addMod(MOD_INT,4);
	effect:subtractMod(MOD_CHR,1);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
