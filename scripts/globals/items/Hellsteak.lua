-----------------------------------
--	Author: Bababooey
-- 	Hellsteak
-- 	A thick steak of cerberus meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Hellsteak
--	
--	3 Hours, All Races
--	HP +20
--	Strength +6
--	Intelligence -2
--	Attack +19.5% (Cap: ???)
--	Ranged Attack +19.5% (Cap: ???)
-- 	Demon Killer
--	Dragon Killer
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
		user:addStatusEffect(EFFECT_FOOD,5609,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5609,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 