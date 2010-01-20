-----------------------------------
--	Author: Bababooey
-- 	Grilled Lik
-- 	This lik on a stick is guaranteed to make you lick your lips. 
--
--	http://wiki.ffxiclopedia.org/wiki/Grilled_Lik
--	
--	EFFECTS UNKNOWN
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
		user:addStatusEffect(EFFECT_FOOD,5648,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5648,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 