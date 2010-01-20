-----------------------------------
--	Author: Psy aka psyclosis
--  cinna-cookie
--	This cookie is seasoned with cinnamon. 
--
--	http://wiki.ffxiclopedia.org/wiki/Cinna-cookie
-- 
-- 3 minutes, All Races
-- MP Recovered while healing +4
-- Vermin Killer
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
		user:addStatusEffect(EFFECT_FOOD,4397,0,180); --Adds the "has food" effect.
		user:addStatusEffect(4397,1,0,180); --Adds effects specific to this food.
	end
end; 
 
 
 