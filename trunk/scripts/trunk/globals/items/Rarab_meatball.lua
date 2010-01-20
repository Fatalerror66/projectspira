-----------------------------------
--	Author: Bababooey
-- 	Rarab Meatball
-- 	A tasty snack of ground wild hare meat.  
--
--	http://wiki.ffxiclopedia.org/wiki/Rarab_Meatball
--	
--	3 Hours, All Races
--	HP +10
--	Strength +2
--	Vitality +2
--	Intelligence -1
--	Attack +30% (Cap: 20@66 Base Attack)
--	Ranged Attack +30% (Cap: 20@66 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4507,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4507,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 