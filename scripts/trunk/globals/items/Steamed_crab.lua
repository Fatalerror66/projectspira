-----------------------------------
--	Author: Bababooey
-- 	Steamed Crab
-- 	One step above your average boiled crab. 
--
--	http://wiki.ffxiclopedia.org/wiki/Steamed_Crab
--	
--
--	60 Minutes, All Races
--	Vitality +3
--	Defense +27% (Cap: 55@203 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4342,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4342,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 