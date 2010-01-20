-----------------------------------
--	Author: Bababooey
-- 	Red Curry
-- 	A delicious curry with dragon meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Red_Curry
--
--	3 Hours All Races
--	HP +25
--	Strength +7
--	Agility +1
--	Intelligence -2
--	HP Recovered while healing +2
--	MP Recovered while healing +1
--	Attack +23% (Cap: 150@652 Base Attack)
--	Ranged Attack +23% (Cap: 150@652 Base Ranged Attack)
--	Demon Killer
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
		user:addStatusEffect(EFFECT_FOOD,4298,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4298,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 