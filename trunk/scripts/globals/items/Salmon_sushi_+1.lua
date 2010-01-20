-----------------------------------
--	Author: Bababooey
-- 	Salmon Sushi +1
--  Salmon sushi so succulent, you'll make the trek back upstream to get more. 
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Strength +2
--	Accuracy +15%
--	Ranged Accuracy +15%
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
		user:addStatusEffect(EFFECT_FOOD,5664,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5664,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 