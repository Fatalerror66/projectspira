-----------------------------------
--	Author: Psy aka psyclosis
--  Bowl of Sutlac 
-- 
--	A pudding-style dessert made from
--  rice, milk, and eggs.  
--
--	http://wiki.ffxiclopedia.org/wiki/Sutlac
-- 
--  3 Hours, All Races
--  Group Food
--  MP +10
--  Intelligence +1
--  MP Recovered while healing +2
--  HP +8
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_INT,1);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HP,8);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
