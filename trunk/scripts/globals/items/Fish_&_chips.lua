-----------------------------------
--	Author: Bababooey
-- 	Fish & Chips
-- 	Whitefish and popotoes fried to a golden brown and served with creamy
--	Tarutaru sauce. A traditional Tavnazian dish.
--
--	http://wiki.ffxiclopedia.org/wiki/Fish_and_Chips
--	
--	3 Hours, All Races
--	Dexterity +3
--	Vitality +3
--	Mind -3
--	Defense +5% 
--	Ranged Attack +7% (Cap: 10@142 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5145,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5145,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 