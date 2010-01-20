-----------------------------------
--	Author: Bababooey
-- 	Hard-Boiled Egg
-- 	A boiled egg. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hard-Boiled_Egg
--	
--	30 Minutes, All Races
--	HP +10
--	MP +10
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
		user:addStatusEffect(EFFECT_FOOD,4409,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4409,1,0,1800); --Adds effects specific to this food.
	end;
end; 
 
 
 