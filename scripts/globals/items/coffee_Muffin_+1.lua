-----------------------------------
--	Author: Psy aka psyclosis
--  Coffeecake muffin +1
--	An exceptionally aromatic coffee muffin. 
--
--	http://wiki.ffxiclopedia.org/wiki/Coffee_Muffin_%2B1
-- 
-- 60 min, All Races
-- MP  +10% (Cap 90@900 base MP)
-- Strength -1
-- Mind +2
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
		user:addStatusEffect(EFFECT_FOOD,5656,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5656,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 