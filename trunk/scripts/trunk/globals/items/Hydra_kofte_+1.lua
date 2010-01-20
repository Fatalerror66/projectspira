-----------------------------------
--	Author: Bababooey
-- 	Hydra Kofte +1
-- 	This hydra kofte has been baked to absolute perfection. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hydra_Kofte_%2B1
--	
--	4 Hours, All Races
--	Strength +7
--	Intelligence -3
--	Attack +21% (Cap: ???)
--  Ranged Attack +20% (Cap: ???)
--	Defense +25% (Cap: ???)
--	Resist Poison
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
		user:addStatusEffect(EFFECT_FOOD,5603,14400); --Adds the "has food" effect.
		user:addStatusEffect(5603,1,0,14400); --Adds effects specific to this food.
	end;
end; 
 
 
 