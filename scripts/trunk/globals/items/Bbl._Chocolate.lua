-----------------------------------
--	Author: Psy aka psyclosis
--  Bubble Chocolate
--	A chocolate with lighter-than-air
--  bubbles. It floats when you let go. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bubble_Chocolate
-- 
-- 30 minutes, All Races
-- MP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,4496,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4496,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 