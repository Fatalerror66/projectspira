-----------------------------------
--	Author: Bababooey
-- 	Roast Pipira
-- 	A pipira on a stick, grilled with salt.
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Pipira
--	
--	30 Minutes, All Races
--	Dexterity +3
--	Mind -1
--	Attack +14% (Cap: 85@607 Base Attack)
--	Ranged Attack +14% (Cap: 85@607 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4538,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4538,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 