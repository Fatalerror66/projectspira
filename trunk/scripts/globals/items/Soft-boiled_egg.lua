-----------------------------------
--	Author: Bababooey
-- 	Soft-Boiled Egg
-- 	A soft-boiled egg. 
--
--	http://wiki.ffxiclopedia.org/wiki/Soft-Boiled_Egg
--	
--	60 Minutes, All Races
--	HP +20
--	MP +20
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
		user:addStatusEffect(EFFECT_FOOD,4532,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4532,1,0,3600); --Adds effects specific to this food.
	end;
end; 
 
 
 