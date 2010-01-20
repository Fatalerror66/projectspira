-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of cherry bavarois
--	A delectable cherry cream thickened
--  with gelatin, then chilled and molded
--  into a scrumptious dessert. 
--
--	http://wiki.ffxiclopedia.org/wiki/Cherry_Bavarois
-- 
-- 3 Hours, All Races
-- HP +25
-- Intelligence +3
-- MP +10
-- HP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,5745,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5745,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 