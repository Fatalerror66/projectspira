-----------------------------------
--	Author: Bababooey
-- 	Galkan Sausage
-- 	A traditional Galkan sausage made with giant sheep meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Galkan_Sausage
--	
--	30 Minutes, All Races
--	Strength +3
--	Intelligence -4
--	Attack +9
--	Ranged Attack +9
--
--	30 Minuets, Galka Only
--	Strength +3
--	Intelligence -1
--	Attack +25% (Cap: 30@120 Base Attack)
--	Ranged Attack +25% (Cap: 30@120 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4395,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4395,1,0,1800); --Adds effects specific to this food.
	end;
end; 
 
 
 