-----------------------------------
--	Author: Psy aka psyclosis
--  Sweet Baked Apple
--	A sweetened and baked apple.
--
--	http://wiki.ffxiclopedia.org/wiki/Baked_Apple
-- 
-- 60 minutes, All Races
-- MP +25
-- MP Recovered while Healing +2
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
		user:addStatusEffect(EFFECT_FOOD,4336,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4336,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 