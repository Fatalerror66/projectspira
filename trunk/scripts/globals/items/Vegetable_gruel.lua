-----------------------------------
--	Author: Bababooey
-- 	Vegetable Gruel
-- 	A boiled porridge made from a variety of vegetables mixed with flour or rice. 
--
--	http://wiki.ffxiclopedia.org/wiki/Vegetable_Gruel
--
--	3 Hours, All Races
--	Vitality -1
--	Agility +2
--	Ranged Accuracy +15% (Cap: 10)
--	HP Recovered while healing +4
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
		user:addStatusEffect(EFFECT_FOOD,4489,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4489,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 