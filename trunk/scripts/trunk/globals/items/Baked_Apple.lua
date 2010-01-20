-----------------------------------
--	Author: Psy aka psyclosis
--  Baked Apple
--	A sweetened and baked apple.
--
--	http://wiki.ffxiclopedia.org/wiki/Baked_Apple
-- 
-- 30 minutes, All Races
-- MP +20
-- Agility -1
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
		user:addStatusEffect(EFFECT_FOOD,4406,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4406,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 