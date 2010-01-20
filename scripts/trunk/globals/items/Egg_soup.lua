-----------------------------------
--	Author: Bababooey
-- 	Egg Soup
-- 	A soup made from eggs.
--
--	http://wiki.ffxiclopedia.org/wiki/Egg_Soup
--
--	3 Hours, All Races
--	HP +5.5% (Cap: 30@545 Base HP)
--	MP +5
--	HP Recovered while healing +5
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
		user:addStatusEffect(EFFECT_FOOD,4417,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4417,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 