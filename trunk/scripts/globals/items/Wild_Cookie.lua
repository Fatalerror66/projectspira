-----------------------------------
--	Author: Psy aka psyclosis
--  Wild Cookie 
--	A deliciously baked acorn cookie. 
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Cookie
-- 
-- 5 minutes, All Races
-- MP Recovered while healing +5
-- Aquan Killer
-- Resist Sleep
----------------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4577,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4577,1,0,300); --Adds effects specific to this food.
	end
end; 
 
 
 