-----------------------------------
--	Author: Psy aka psyclosis
--  melon pie
--	A shockingly good pie made from thundermelons.
--
--	http://wiki.ffxiclopedia.org/wiki/Melon_Pie
-- 
-- 30 minutes, All Races
-- MP +25
-- Intelligence +4
-- Agility -1
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
		user:addStatusEffect(EFFECT_FOOD,4421,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4421,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 