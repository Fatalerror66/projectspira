-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of vermillion jelly
-- 
--	This is about as tasty as you can
--  make the detoxified gelatinous remains
--  of a clot.  
--
--	http://wiki.ffxiclopedia.org/wiki/Vermillion_Jelly
-- 
--  4 Hours, All Races
--  MP +12%(Cap: 90@750 Base MP)
--  Intelligence +6
--  MP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,5158,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5158,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 