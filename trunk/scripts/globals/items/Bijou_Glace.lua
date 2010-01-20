-----------------------------------
--	Author: Psy aka psyclosis
--  Bijou Glace
--	This marron glace has the luster of a rare gem.
--
--	http://wiki.ffxiclopedia.org/wiki/Bijou_Glace
-- 
-- 4 hours, All Races
-- MP +13%9Cap: 90@692 Base MP)	
-- MP Recovered While Healing +1
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
		user:addStatusEffect(EFFECT_FOOD,4269,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4269,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 