----------------------------------
--	Author: Psy aka psyclosis
--  Piece of witch nougat
--
--	This ridiculously sweet candy is
--  said to be a favorite among witches.
-- 
--  http://wiki.ffxiclopedia.org/wiki/Witch_Nougat
--  60 min, All Races
--  HP +50
--  Intelligence +3
--  Agility -3
----------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,3);
	effect:addMod(MOD_INT,3);
	effect:addMod(MOD_HP,50);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
