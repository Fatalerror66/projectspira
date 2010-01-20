-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of black pudding
--
--  A Windurstian dessert made for
--  the Starlight Celebration.
--  Symbolizes a legendary monster
--  feared by the Mithra. 
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Black_Pudding
--
--  3 hours, All Races
--  Group Effects
--  MP Recovered while healing +2
--  MP +4% (cap:25@625 Base MP)
--  HP +8
--  INT +4
------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5552,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5550,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 