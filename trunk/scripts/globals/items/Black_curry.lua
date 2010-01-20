-----------------------------------
--	Author: Bababooey
-- 	Black Curry
-- 	A delicious curry with tuna. 
--
--	http://wiki.ffxiclopedia.org/wiki/Black_Curry
--
--	3 Hours All Races
--	Dexterity +2
--	Vitality +4
--	Intelligence +1
--	HP Recovered while healing +2
--	MP Recovered while healing +1
--	Defense +15%
--	Accuracy +5
--	Ranged Accuracy +5
--	Evasion +5
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
		user:addStatusEffect(EFFECT_FOOD,4297,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4297,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 