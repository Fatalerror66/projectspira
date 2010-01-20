-----------------------------------
--	Author: Bababooey
-- 	Fatty Tuna Sushi
-- 	Sliced, raw fatty tuna served on a small portion of sweet vinegar rice.
--	Fatty tuna is twice as expensive as regular tuna. 
--
--	http://wiki.ffxiclopedia.org/wiki/Fatty_Tuna_Sushi
--	
--	60 Minutes, All Races
--	HP +20
--	Dexterity +3
--	Charisma +5
--	Resist Sleep
--	Accuracy +16%
--	Ranged Accuracy +16%
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
		user:addStatusEffect(EFFECT_FOOD,5153,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5153,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 