-----------------------------------
--	Author: Bababooey
-- 	Prime Angler Stewpot
-- 	The cooking of this angler stewpot was strictly supervised to ensure
--	that the ingredients were added in the proper manner. 
--
--	http://wiki.ffxiclopedia.org/wiki/Prime_Angler_Stewpot
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
		user:addStatusEffect(EFFECT_FOOD,5612,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5612,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 