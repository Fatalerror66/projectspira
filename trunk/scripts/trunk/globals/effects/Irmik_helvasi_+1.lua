-----------------------------------
--	Author: Psy aka psyclosis
--  Irmik Helvasi +1 
--	An irmik helvasi baked to perfection
--  by a master patissier.  
--
--	http://wiki.ffxiclopedia.org/wiki/Irmik_Helvasi_%2B1
-- 
--  4 hrs, All Races
--  Group Food
--  MP Recovered while healing +1
--  MP +3(Cap: 20@575MP) !!Cap on wiki not verified
--  HP +10(Cap: 75@750Base HP)!! cap on wiki not verified
--  INT +1
-----------------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_FOOD_MPP,3);
	effect:addMod(MOD_FOOD_MP_CAP,20);
	effect:addMod(MOD_FOOD_HPP,10);
	effect:addMod(MOD_FOOD_HP_CAP,75);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
