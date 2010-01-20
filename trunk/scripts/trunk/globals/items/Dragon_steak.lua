-----------------------------------
--	Author: Bababooey
-- 	Dragon Steak
-- 	This extra-thick cut of dragon meat will give you so much
--  energy that you will not sleep for three days.
--
--	http://wiki.ffxiclopedia.org/wiki/Dragon_Steak
--	
--	3 Hours, All Races
--	HP +25
--	Strength +7
--	Intelligence -3
--	Attack +20% (Cap: 150@750 Base Attack)
--	Ranged Attack +20% (Cap: 150@750 Base Ranged Attack
--	HP Recovered while healing +2
--	MP Recovered while healing +2
--	Demon Killer
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
		user:addStatusEffect(EFFECT_FOOD,4350,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4350,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 