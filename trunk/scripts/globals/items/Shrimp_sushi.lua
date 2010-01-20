-----------------------------------
--	Author: Bababooey
-- 	Shrimp Sushi
--  A delicacy hailing from the eastern lands consisting of a sweeper laid
--	across subtly flavored rice.
--
--	http://wiki.ffxiclopedia.org/wiki/Shrimp_Sushi
--	
--	30 Minutes, All Races (duration unknown)
--	Vitality +1
--	Defense +5
--	Accuracy +11%
--	Store TP +2
--	Triple Attack +1%
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
		user:addStatusEffect(EFFECT_FOOD,5691,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5691,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 