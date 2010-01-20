-----------------------------------
--	Author: Bababooey
-- 	Roast Mutton
-- 	A great slab of roasted giant sheep meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Mutton
--	
--	3 Hours, All Races
--	Strength +3
--	Intelligence -1
--	Attack +27% (Cap: 30@111 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4437,10800); --Adds the "has food" effect.
		user:addStatusEffect(4437,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 