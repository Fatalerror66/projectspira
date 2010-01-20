-----------------------------------
--	Author: Bababooey
-- 	Green Curry
-- 	A delicious curry with crayfish.
--
--	http://wiki.ffxiclopedia.org/wiki/Green_Curry
--
--	3 Hours, All Races
--	Agility +2
--	Vitality +1
--	Defense +8.5%
--	HP Recovered while healing +2
--	MP Recovered while healing +1
--	Ranged Accuracy +5% (Cap: 25)
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
		user:addStatusEffect(EFFECT_FOOD,4296,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4296,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 