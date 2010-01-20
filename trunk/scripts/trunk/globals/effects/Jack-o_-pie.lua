-----------------------------------
--	Author: Psy aka psyclosis
--  Jack-o'-pie
--	This delicious pumpkin pie is decorated with a frighteneing face.
--
--	http://wiki.ffxiclopedia.org/wiki/Jack-o'-Pie
-- 
-- 60 minutes, All Races
-- MP +45
-- Intelligence +4
-- Charisma -1
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,45);
	effect:addMod(MOD_INT,4);
	effect:subtractMod(MOD_CHR,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
