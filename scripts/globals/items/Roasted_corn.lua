-----------------------------------
--	Author: Bababooey
-- 	Roasted Corn
-- 	A roasted ear of corn, lightly sweetened.
--
--	http://wiki.ffxiclopedia.org/wiki/Roasted_Corn
--	
--	30 Minutes, All Races
--	HP +6
--	Vitality +3
--	Dexterity -1
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
		user:addStatusEffect(EFFECT_FOOD,4415,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4415,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 