-----------------------------------
--	Author: Psy aka psyclosis
--  Dried Date +1
--	These dried dates are unbelievably sweet.  
--	http://wiki.ffxiclopedia.org/wiki/Dried_Date_%2B1
-- 
-- 60 min, All Races
-- INT +4
-- AGI -1
-- HP +12
-- MP +22
--------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5574,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5574,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 