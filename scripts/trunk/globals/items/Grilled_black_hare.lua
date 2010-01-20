-----------------------------------
--	Author: Bababooey
-- 	Grilled Black Hare
-- 	Deliciously roasted wild hare meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Grilled_Black_Hare
--	
--	4 Hours, All Races
--	Strength +2
--	Intelligence -1
--	Attack +30% (Cap: 20@66 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4516,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4516,1,0,14400); --Adds effects specific to this food.
	end;
end; 
 
 
 