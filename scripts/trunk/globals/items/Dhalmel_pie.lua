-----------------------------------
--	Author: Bababooey
-- 	Dhalmel Pie
-- 	A savory pie made from dhalmel meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Dhalmel_Pie
--	
--	30 Minutes, All Races
--	HP +25
--	Strength +4
--	Vitality +1
--	Agility +2
--	Intelligence -2
--	Mind +1
--	Attack +25% (Cap: 45@180 Base Attack)
--  Ranged Attack +25% (Cap: 45@180 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4411,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4411,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 