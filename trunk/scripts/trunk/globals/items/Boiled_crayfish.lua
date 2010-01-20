-----------------------------------
--	Author: Bababooey
-- 	Boiler Crayfish
-- 	A crayfish boiled in a salty broth.
--
--	http://wiki.ffxiclopedia.org/wiki/Boiled_Crayfish
--	
--
--	30 Minutes, All Races
--	Defense +30% (Cap: 25@83 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4535,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4535,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 