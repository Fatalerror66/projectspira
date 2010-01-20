-----------------------------------
--	Author: Bababooey
-- 	Grilled Hare
-- 	Wild rabbit meat roasted on a grill.
--
--	http://wiki.ffxiclopedia.org/wiki/Grilled_Hare
--	
--	3 Hours, All Races
--	Strength +2
--	Intelligence -1
--	Attack +30% (Cap: 15@50 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4371,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4371,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 