-----------------------------------
--	Author: Bababooey
-- 	Yellow Curry Bun +1
-- 	With a generous portion of savory yellow curry nearly bursting from its
--	flaky crust, this piping hot bun is truly a treat to all five senses. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yellow_Curry_Bun_%2B1
--
--	30 Minutes, All Races
--	HP +30
--	Strength +5
--	Agility +2
--	Vitality +2
--	Intelligence -2
--	Attack +23% (Cap: 80@375 Base Attack) 
--	Ranged Attack +23% (Cap: 80@375 Base Ranged Attack) 
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
		user:addStatusEffect(EFFECT_FOOD,5763,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5763,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 