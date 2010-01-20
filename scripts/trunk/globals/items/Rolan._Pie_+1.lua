-----------------------------------
--	Author: Psy aka psyclosis
--  Rolanberry pie +1
--	One of the most delicious rolanberry pies you have ever tasted.
--
--	http://wiki.ffxiclopedia.org/wiki/Rolanberry_Pie_+1
-- 
-- 60 minutes, All Races
-- MP +60
-- Intelligence +3
-- HP Recovered While Healing +1
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
		user:addStatusEffect(EFFECT_FOOD,4339,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4339,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 