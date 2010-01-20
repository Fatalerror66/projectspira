-----------------------------------
--	Author: Bababooey
--	Tentacle Sushi
-- 	A Far Eastern dish made by shaping steamed rice into a 
--	ball and topping it off with raw squid tentacles.
--
--	http://wiki.ffxiclopedia.org/wiki/Tentacle_Sushi
--	
--	30 Minutes, All Races
--	HP +20
--	Dexterity +3
--	Mind -1
--	Agility +3
--	Accuracy +19% (Cap: 18@95)
--	Ranged Accuracy +19% (Cap: 18@95)
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
		user:addStatusEffect(EFFECT_FOOD,5215,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5215,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 