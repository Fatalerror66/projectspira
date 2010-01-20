-----------------------------------
--	Author: Bababooey
-- 	Goblin Stew
-- 	 
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Stew
--
--	3 Hours All Races
--	Dexterity -4
--	Attack +15.5%
--	Ranged Attack +15.5%
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
		user:addStatusEffect(EFFECT_FOOD,4465,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4465,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 