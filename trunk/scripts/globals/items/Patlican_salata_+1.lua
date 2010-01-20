-----------------------------------
--	Author: Bababooey
-- 	Patlican Salata +1
-- 	Eggplants mixed with yogurt couldn't possibly taste any better than this.
--
--	http://wiki.ffxiclopedia.org/wiki/Patlican_Salata_%2B1
--	
--	4 Hours, All Races
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
		user:addStatusEffect(EFFECT_FOOD,5583,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5583,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 