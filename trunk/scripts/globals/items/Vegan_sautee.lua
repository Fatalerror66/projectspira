-----------------------------------
--	Author: Bababooey
-- 	Vegan Sautee
-- 	Vegetarians all over Vana'diel adore this specially 
--	prepared batagreen sautee.
--
--	http://wiki.ffxiclopedia.org/wiki/Vegan_Sautee
--	
--	4 Hours, All Races
--	Vitailty -1
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
		user:addStatusEffect(EFFECT_FOOD,5184,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5184,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 