-----------------------------------
--	Author: Bababooey
--  Octopus Sushi +1
-- 	The rice is packed to just the right consistency and the suckers on the
--	tentacle still show signs of life. So fresh! 
--
--	http://wiki.ffxiclopedia.org/wiki/Octopus_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Strength +2
--	Accuracy +15-16% (Unconfirmed)
--	????
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
		user:addStatusEffect(EFFECT_FOOD,5694,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5694,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 