-----------------------------------
--	Author: Bababooey
-- 	Bream Sushi +1
-- 	The kind of sushi that breams are made of. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bream_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Dexterity +6
--	Vitality +5
--	Resist Sleep
--	Accuracy +17%
--	Ranged Accuracy +17%
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
		user:addStatusEffect(EFFECT_FOOD,5177,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5177,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 