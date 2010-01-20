-----------------------------------
--	Author: Psy aka psyclosis
--  Opo Opo Tart
--	Even opo-opos cannot resist the delightful aroma of this 
--  titillating pamama tart.
--	http://wiki.ffxiclopedia.org/wiki/pamama_tart
-- 
-- 60 minutes, All Races
-- MP +12
-- Intelligence +4
-- HP +12
-- MP recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,4287,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4287,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 