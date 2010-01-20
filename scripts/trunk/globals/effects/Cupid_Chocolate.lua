-----------------------------------
--	Author: Psy aka psyclosis
--  Cupid chocolate 
--	A beautifully wrapped, heart-shaped
--  chocolate. A Cupid's arrow design has
--  been printed in its center.
--
--	http://wiki.ffxiclopedia.org/wiki/Cupid_Chocolate
-- 
-- 3 hrs, All Races
-- Attack +10
---------------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_ATT,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
