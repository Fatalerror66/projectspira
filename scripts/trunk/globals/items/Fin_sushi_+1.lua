-----------------------------------
--	Author: Bababooey
-- 	Fin Sushi +1
-- 	When the fins taste this good, who needs the rest of the fish? 
--
--	http://wiki.ffxiclopedia.org/wiki/Fin_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Intelligence +5
--	Accuracy +17%
--	Ranged Accuracy +17%
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
		user:addStatusEffect(EFFECT_FOOD,5666,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5666,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 