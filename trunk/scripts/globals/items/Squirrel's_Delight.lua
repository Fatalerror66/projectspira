-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of squirrel's delight
--
--	Made by a master patissier,
--  this gleaming marron glace is sure
--  to delight anyone who takes a bite. 
--
--	http://wiki.ffxiclopedia.org/wiki/Squirrel%27s_Delight
-- 
--  4 hours, All Races
--  MP +13% (Cap: 95@731 Base MP)	
--  MP Recovered While Healing +2
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
		user:addStatusEffect(EFFECT_FOOD,5554,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5554,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 