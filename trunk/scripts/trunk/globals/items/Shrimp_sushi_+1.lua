-----------------------------------
--	Author: Bababooey
-- 	Shrimp Sushi +1
--  The rice is packed to just the right consistency and the shrimp 
--	is still twitching. It is perfect. 
--
--	http://wiki.ffxiclopedia.org/wiki/Shrimp_Sushi_%2B1
--	
--	60 Minutes, All Races (duration unknown)
--	Vitality +1
--	Defense +5
--	Accuracy +11%
--	Store TP +2
--	Triple Attack +1%
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
		user:addStatusEffect(EFFECT_FOOD,5692,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5692,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 