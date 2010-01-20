-----------------------------------
--	Author: Bababooey
-- 	Green Curry Bun +1
-- 	With a generous portion of savory green curry nearly bursting from its
--	flaky crust, this piping hot bun is truly a treat to all five senses.  
--
--	http://wiki.ffxiclopedia.org/wiki/Green_Curry_Bun_%2B1
--
--	60 Minutes, All Races
--	Vitality +1
--	Agility +2
--	Defense +12%
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
		user:addStatusEffect(EFFECT_FOOD,5762,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5762,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 