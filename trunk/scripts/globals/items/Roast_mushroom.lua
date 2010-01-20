-----------------------------------
--	Author: Bababooey
-- 	Roast Mushroom
-- 	Lightly roasted mushrooms on a stick.
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Mushroom
--	
--	30 Minutes, All Races
--	MP +10
--	Strength -1
--	Mind +3
--	MP Recovered while healing +2
--	Enmity -1
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
		user:addStatusEffect(EFFECT_FOOD,4410,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4410,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 