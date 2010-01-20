-----------------------------------
--	Author: Psy aka psyclosis
--  Acorn Cookie
--	A cookie made with roasted acorns
--
--	http://wiki.ffxiclopedia.org/wiki/Acorn_Cookie
-- 
-- 3 minutes, All Races
-- MP Recovered while healing +3
-- Aquan Killer
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
		user:addStatusEffect(EFFECT_FOOD,4510,0,180); --Adds the "has food" effect.
		user:addStatusEffect(4510,1,0,180); --Adds effects specific to this food.
	end
end; 
 
 
 