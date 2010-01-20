----------------------------------
--	Author: Psy aka psyclosis
--  Serving of dusky indulgence
--
--  Made by a master patissier,
--  this gleaming black pudding
--  simply begs for a taste.
-- 
--  http://wiki.ffxiclopedia.org/wiki/Dusky_Indulgence
--
--  4 hours, All Races
--  Group Effects
--  MP Recovered while healing +2
--  HP Recovered while healing +2
--  MP +5% (cap:30@600 Base MP)
--  HP +10
--  INT +4
---------------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5553,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5553,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 