-----------------------------------
--	Author: Bababooey
--  Octopus Sushi
-- 	A delicacy hailing from the eastern lands consisting of a cut of octopus
--	laid across subtly flavored rice. 
--
--	http://wiki.ffxiclopedia.org/wiki/Octopus_Sushi
--	
--	30 Minutes, All Races
--	Strength +1
--	Accuracy +15-16%
--	????
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
		user:addStatusEffect(EFFECT_FOOD,5693,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5693,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 