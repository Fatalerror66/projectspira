-----------------------------------
--	Author: Psy aka psyclosis
--  Coin cookie
--	One of the best cinnamon cookies you'll ever eat.  
--
--	http://wiki.ffxiclopedia.org/wiki/Coin_Cookie
-- 
-- 5 minutes, All Races
-- MP Recovered while healing +6
-- Vernmin Killer
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
		user:addStatusEffect(EFFECT_FOOD,4520,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4520,1,0,300); --Adds effects specific to this food.
	end
end; 
 
 
 