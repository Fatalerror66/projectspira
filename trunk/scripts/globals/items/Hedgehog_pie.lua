-----------------------------------
--	Author: Bababooey
-- 	Hedgehog Pie
-- 	Shredded meat wrapped and baked in a bean-laden crust, garnished with
--	baby carrots.
--
--	http://wiki.ffxiclopedia.org/wiki/Hedgehog_Pie
--	
--	3 Hours, All Races
--	HP +55
--	Strength +6
--	Vitality +2
--	Intelligence -3
--	Mind +3
--	MP Recovered while healing +2
--	Accuracy +5
--	Attack +18% (Cap: 90@500 Base Attack)
--	Ranged Attack +18% (Cap: 90@500 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5146,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5146,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 