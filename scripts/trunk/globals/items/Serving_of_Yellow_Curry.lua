-----------------------------------
--	Author: Bababooey
-- 	Yellow Curry
-- 	A delicious curry with coeurl meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yellow_Curry
--
--	3 Hours All Races
--	HP +20
--	Strength +5
--	Agility +2
--	Intelligence -4
--	HP Recovered while healing +2
--	MP Recovered while healing +1
--	Attack +20% (Cap: 75@375 Base Attack)
--	Ranged Attack +20% (Cap: 75@375 Base Ranged Attack)
--	Resist Sleep
-- 	Resist Stun
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
		user:addStatusEffect(EFFECT_FOOD,4517,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4517,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 