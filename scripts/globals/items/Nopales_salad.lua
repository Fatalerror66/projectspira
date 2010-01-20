-----------------------------------
--	Author: Bababooey
-- 	Nopales Salad
-- 	A well-rounded salad whose main ingredient is finely diced nopales. 
--
--	http://wiki.ffxiclopedia.org/wiki/Nopales_Salad
--	
--	3 Hours, All Races
--	Strength +1
--	Agility +6
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
		user:addStatusEffect(EFFECT_FOOD,5701,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5701,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 