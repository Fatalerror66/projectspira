-----------------------------------
--	Author: Bababooey
-- 	Salmon Sushi
--  Sliced, raw salmon served on a small portion of sweet vinegar rice--a
--	popular dish in Far Eastern nations. 
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Sushi
--	
--	30 Minutes, All Races
--	Strength +1
--	Accuracy +14%
--	Ranged Accuracy +14%
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
		user:addStatusEffect(EFFECT_FOOD,5663,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5663,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 