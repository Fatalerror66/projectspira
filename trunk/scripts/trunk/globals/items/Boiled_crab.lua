-----------------------------------
--	Author: Bababooey
-- 	Boiler Crab
-- 	Boiled meat of the land crab. 
--
--	http://wiki.ffxiclopedia.org/wiki/Boiled_Crab
--	
--
--	30 Minutes, All Races
--	Vitality +2
--	Defense +27% (Cap: 50@185 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4456,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4456,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 