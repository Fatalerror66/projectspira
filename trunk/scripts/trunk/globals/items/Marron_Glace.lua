-----------------------------------
--	Author: Psy aka psyclosis
--  Marron Glace
--	This marron glace has the luster of a rare gem.
--
--	http://wiki.ffxiclopedia.org/wiki/Marron_Glace
-- 
-- 3 hours, All Races
-- MP +13% (Cap: 85@653 Base MP)	
-- MP Recovered While Healing +1
-- Agility -1
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
		user:addStatusEffect(EFFECT_FOOD,4502,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4502,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 