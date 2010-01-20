-----------------------------------
--	Author: Bababooey
-- 	Colored Egg
-- 	A beautifully painted egg. Given as a present. 
--
--	http://wiki.ffxiclopedia.org/wiki/Colored_Egg
--	
--	30 Minutes, All Races
--	HP +20
--	MP +20
--	Attack +3
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
		user:addStatusEffect(EFFECT_FOOD,4487,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4487,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 