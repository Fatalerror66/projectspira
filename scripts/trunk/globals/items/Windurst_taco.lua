-----------------------------------
--	Author: Bababooey
-- 	Windurst Taco
-- 	A simple snack consisting of Windurst salad wrapped in a warm tortilla.
--
--	http://wiki.ffxiclopedia.org/wiki/Windurst_Taco
--	
--	30 Minutes, All Races
--	MP +20
--	MP Recovered while healing +1
--	Vitality -1
--	Agility +5
--	Ranged Accuracy +8% (Cap: 10@125)
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
		user:addStatusEffect(EFFECT_FOOD,5172,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5172,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 