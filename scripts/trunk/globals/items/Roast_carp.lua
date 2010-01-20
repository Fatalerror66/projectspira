-----------------------------------
--	Author: Bababooey
-- 	Roast Carp
-- 	A carp on a stick, grilled with salt. 
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Carp
--	
--	30 Minutes, All Races
--	Dexterity +1
--	Mind -1
--	Ranged Attack +14%
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
		user:addStatusEffect(EFFECT_FOOD,4537,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4537,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 