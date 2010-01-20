-----------------------------------
--	Author: Bababooey
-- 	Timbre Timbers Taco
-- 	Possibly the most mouthwatering Windurst taco you will ever 
--	sink your teeth into.
--
--	http://wiki.ffxiclopedia.org/wiki/Timbre_Timbers_Taco
--	
--	60 Minutes, All Races
--	MP +20
--	MP Recovered while healing +3
--	Vitality -1
--	Agility +5
--	Ranged Accuracy +8% (Cap: 15@188)
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
		user:addStatusEffect(EFFECT_FOOD,5173,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5173,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 