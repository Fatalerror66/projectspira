-----------------------------------
--	Author: Bababooey
-- 	Monastic Sautee
-- 	The beaugreens in this sautee have been cooked in the manner 
--	followed by the monks of San d'Oria.
--
--	http://wiki.ffxiclopedia.org/wiki/Monastic_Sautee
--	
--	4 Hours, All Races
--	Agility +1
--	Ranged Accuracy +7% (Cap: 20@286)
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
		user:addStatusEffect(EFFECT_FOOD,4293,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4293,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 