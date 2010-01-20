-----------------------------------
--	Author: Bababooey
--	Tentacle Sushi +1
-- 	Raw squid tentacles don't get any better than this!
--
--	http://wiki.ffxiclopedia.org/wiki/Tentacle_Sushi_%2B1
--	
--	60 Minutes, All Races
--	HP +20
--	Dexterity +3
--	Mind -1
--	Agility +3
--	Accuracy +19% (Cap: 23@121)
--	Ranged Accuracy +19% (Cap: 23@121)
--	Double Attack +1%
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
		user:addStatusEffect(EFFECT_FOOD,5216,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5216,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 