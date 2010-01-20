-----------------------------------
--	Author: Psy aka psyclosis
--  Pumpkin Pie 
--	A yummy pie made from ogre pumpkins.
--
--	http://wiki.ffxiclopedia.org/wiki/Pumpkin_Pie
-- 
-- 30 minutes, All Races
-- MP +40
-- Intelligence +3
-- Agility -1
-- Charisma -2 
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,40);
	effect:addMod(MOD_INT,3);
	effect:subtractMod(MOD_AGI,1);
	effect:subtractMod(MOD_CHR,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
