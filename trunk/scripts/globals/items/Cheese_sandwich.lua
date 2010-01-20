-----------------------------------
--	Author: Tenjou
-- 	Cheese Sandwich
-- 	A classic sandwich and favorite among the masses.  A simple, profound, and timeless cheese sandwich.
--
--	http://wiki.ffxiclopedia.org/wiki/Cheese_Sandwich
--	HP+10, AGI+1
--	30 minutes
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
		user:addStatusEffect(EFFECT_FOOD,5686,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5686,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 