-----------------------------------
--	Author: Bababooey
-- 	Fin Sushi
-- 	Sliced, raw kalkanba served on a small portion of sweet vinegar rice, a
--	popular dish in Far Eastern nations. 
--
--	http://wiki.ffxiclopedia.org/wiki/Fin_Sushi
--	
--	30 Minutes, All Races
--	Intelligence +5
--	Accuracy +16%
--	Ranged Accuracy +16%
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
		user:addStatusEffect(EFFECT_FOOD,5665,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5665,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 