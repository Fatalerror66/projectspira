-----------------------------------
--	Author: Bababooey
-- 	Salted Hare
-- 	An incredibly simple dish made by roasting hare meat seasoned with salt. 
--
--	http://wiki.ffxiclopedia.org/wiki/Salted_Hare
--	
--	30 Minutes, All Races
--	HP +10
--	Strength +1
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
		user:addStatusEffect(EFFECT_FOOD,5737,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5737,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 