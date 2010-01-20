-----------------------------------
--	Author: Bababooey
-- 	Hellsteak
-- 	This thick steak of cerberus meat remains hot and juicy even if left
--	alone for a long period of time.
--
--	http://wiki.ffxiclopedia.org/wiki/Hellsteak_%2B1
--	
--	4 Hours, All Races
--	HP +25
--	Strength +7
--	Intelligence -3
--	Attack +20.5% (Cap: ???)
--	Ranged Attack +20.5% (Cap: ???)
--	HP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,5610,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5610,1,0,14400); --Adds effects specific to this food.
	end;
end; 
 
 
 