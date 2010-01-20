----------------------------------
--	Author: Psy aka psyclosis
-- Bowl of Sutlac +1
-- 
--	Only a master patissier could have
--  made this exceptionally delicious
--  serving of sutlac.   
--
--	http://wiki.ffxiclopedia.org/wiki/Sutlac_%2B1
-- 
--  4 Hours, All Races
--  Group Food
--  MP +10
--  Intelligence +2
--  MP Recovered while healing +2
--  HP +10
-------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
