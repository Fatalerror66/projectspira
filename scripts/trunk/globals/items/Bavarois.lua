-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of bavarois
--	A delectable fruit cream thickened
--  with gelatin, then chilled and molded
--  into a scrumptious dessert.
--
--	http://wiki.ffxiclopedia.org/wiki/Bavarois
-- 
-- 3 Hours, All Races
-- HP +20
-- Intelligence +3
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
		user:addStatusEffect(EFFECT_FOOD,5729,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5729,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 