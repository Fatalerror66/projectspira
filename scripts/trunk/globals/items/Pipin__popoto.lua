-----------------------------------
--	Author: Bababooey
-- 	Pipin' Hot Popoto
-- 	People praise the pleasant properties of pipin' hot popotoes.
--
--	http://wiki.ffxiclopedia.org/wiki/Pipin%27_Hot_Popoto
--	
--	60 Minutes, All Races
--	HP +25
--	Vitality +3
--	HP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,4282,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4282,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 