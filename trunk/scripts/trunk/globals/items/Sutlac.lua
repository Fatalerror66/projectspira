-----------------------------------
--	Author: Psy aka psyclosis
--  Bowl of Sutlac 
-- 
--	A pudding-style dessert made from
--  rice, milk, and eggs.  
--
--	http://wiki.ffxiclopedia.org/wiki/Sutlac
-- 
--  3 Hours, All Races
--  Group Food
--  MP +10
--  Intelligence +1
--  MP Recovered while healing +2
--  HP +8
----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5577,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5577,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 