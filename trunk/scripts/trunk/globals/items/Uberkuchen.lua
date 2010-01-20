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

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5615,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5615,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 