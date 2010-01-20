-----------------------------------
--	Author: Bababooey
-- 	Sole Sushi +1
--  Only a master chef could have produced such a fine display of Eastern cuisine.
--
--	http://wiki.ffxiclopedia.org/wiki/Sole_Sushi_%2B1
--	
--	60 Minutes, All Races
--	HP +20
--	Strength +5
--	Dexterity +6
--	Accuracy +16%
--	Ranged Accuracy +16%
--	Resist Sleep
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
		user:addStatusEffect(EFFECT_FOOD,5163,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5163,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 