-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of bavarois +1
--	A bavarois among bavarois. Using the finest ripe fruits, 
--  this dish is chilled to the perfect consistency. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bavarois_%2B1
-- 
-- 4 Hours, All Races
-- MP +25
-- Intelligence +4
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
		user:addStatusEffect(EFFECT_FOOD,5730,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5730,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 