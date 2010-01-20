-----------------------------------
--	Author: Psy aka psyclosis
--  melon pie +1
--	A shockingly good pie made from thundermelons.
--
--	http://wiki.ffxiclopedia.org/wiki/Melon_Pie_+1
-- 
-- 60 minutes, All Races
-- MP +30
-- Intelligence +5
-- MP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,4523,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4523,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 