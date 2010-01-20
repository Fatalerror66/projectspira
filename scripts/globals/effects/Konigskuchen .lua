-----------------------------------
--	Author: Psy aka psyclosis
--  Konigskuchen 
--	A Tavnazian cake eaten during the
--  weeks of the Starlight Celebration.
--  It is decorated with a golden crown  
--	http://wiki.ffxiclopedia.org/wiki/Konigskuchen
-- 
-- 3 hrs, All Races
-- INT +2
-- HP +8
-- MP +3%(cap: 13@~433MP)
----------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_HP,8);
	effect:addMod(MOD_FOOD_MPP,3);
	effect:addMod(MOD_FOOD_MP_CAP,13);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
