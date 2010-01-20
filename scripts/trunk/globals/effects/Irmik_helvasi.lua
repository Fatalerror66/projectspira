-----------------------------------
--	Author: Psy aka psyclosis
--  Irmik helvasi
--	A Near Eastern cake topped with pine nuts.
--  Its subtle sweetness makes it go well with chai.  
--
--	http://wiki.ffxiclopedia.org/wiki/Irmik_Helvasi
-- 
--  3 hrs, All Races
--  Group Food
--  MP Recovered while healing +1
--  MP +3(Cap: 13@433MP)
--  HP +10(Cap: 70@700 Base HP)
--  INT +1
-----------------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_FOOD_MPP,3);
	effect:addMod(MOD_FOOD_MP_CAP,13);
	effect:addMod(MOD_FOOD_HPP,10);
	effect:addMod(MOD_FOOD_HP_CAP,70);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
