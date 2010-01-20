-----------------------------------
--	Author: Tenjou
-- 	Bottle of Yagudo drink
--	A secret brew loved by the Yagudo. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yagudo_Drink
--	Refresh Effect +2
--	2 MP per 3 seconds, 120 MP total
--	3 minutes
-----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4558,0,180); --Adds the "has food" effect.
		user:addStatusEffect(4558,1,3,180); --Adds effects specific to this food.
	end
end; 
 
 
 