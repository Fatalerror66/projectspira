-----------------------------------
--	Author: Psy aka psyclosis
--  Uberkuchen
--	This konigskuchen has been crafted
--  by one of the finest patissiers in
--  Vana'diel. It is far more delicious
--  than your ordinary kuchen. 
-- 
-- 4 hrs, All Races
-- INT +3
-- HP +10
-- MP +3%(cap: 13@~433MP)
-- MP Recovered while healing +1
----------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,3);
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_FOOD_MPP,3);
	effect:addMod(MOD_FOOD_MP_CAP,13);
	effect:addMod(MOD_MPHEAL,1);
	
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
