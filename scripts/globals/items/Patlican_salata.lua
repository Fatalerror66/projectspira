-----------------------------------
--	Author: Bababooey
-- 	Patlican Salata
-- 	A salad formed from a blend of eggplants and yogurt.
--
--	http://wiki.ffxiclopedia.org/wiki/Patlican_Salata
--	
--	3 Hours, All Races
--	Vitality -1
--	Agility +4
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
		user:addStatusEffect(EFFECT_FOOD,5582,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5582,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 