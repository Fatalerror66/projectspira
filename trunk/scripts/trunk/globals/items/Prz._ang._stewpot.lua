-----------------------------------
--	Author: Bababooey
-- 	Prize Angler Stewpot
-- 	The cooking of this angler stewpot was directed so that the ingredients
--	were masterfully utilized. Guaranteed to make your mouth water. 
--
--	http://wiki.ffxiclopedia.org/wiki/Prize_Angler_Stewpot
--
--	3 Hours All Races
--	Group Food Effects
--	
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
		user:addStatusEffect(EFFECT_FOOD,5613,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5613,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 