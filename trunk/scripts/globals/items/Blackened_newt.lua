-----------------------------------
--	Author: Bababooey
-- 	Blackened Newt
-- 	This newt has been blackened over charcoal.
--
--	http://wiki.ffxiclopedia.org/wiki/Blackened_Newt
--	3 hours, All Races
--	Dexterity +4
--  Mind -3
--  Attack +18% (Cap: 60@333 Base Attack)
--	Resist Virus
-- 	Resist Curse
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
		user:addStatusEffect(EFFECT_FOOD,4581,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4851,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 