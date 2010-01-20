-----------------------------------
--	Author: Psy aka psyclosis
--  Apple pie +1
--	A sweet pie made from faerie apples.
--
--	http://wiki.ffxiclopedia.org/wiki/Apple_Pie
-- 
-- 60 minutes, All Races
-- MP +30
-- Intelligence +4
-- MP Healing while resting +2
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
		user:addStatusEffect(EFFECT_FOOD,4320,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4320,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 