-----------------------------------
--	Author: Psy aka psyclosis
--  Coffeecake muffin 
--	A tiny cake flavored with coffee.  
--
--	http://wiki.ffxiclopedia.org/wiki/Coffee_Muffin
-- 
-- 30 min, All Races
-- MP  +10% (Cap 85@850 base MP)
-- Strength -1
-- Mind +1
----------------------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5655,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5655,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 