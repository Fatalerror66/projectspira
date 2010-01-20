-----------------------------------
--	Author: Bababooey
-- 	Tomato Soup
-- 	A soup of sweet Mithran tomatoes. 
--
--	http://wiki.ffxiclopedia.org/wiki/Tomato_Soup
--
--	3 Hours, All Races
--	Agility +3
--	Vitality -1
--	HP Recovered while healing +5
--	Ranged Accuracy +9% (Cap: 15)
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
		user:addStatusEffect(EFFECT_FOOD,4420,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4420,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 