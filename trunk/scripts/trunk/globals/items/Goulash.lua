-----------------------------------
--	Author: Bababooey
-- 	Goulash
-- 	A rich and spicy stew made with chunks of coeurl meat and an 
--	assortment of vegetables. A popular ration in the Republic during the Great War.  
--
--	http://wiki.ffxiclopedia.org/wiki/Goulash
--
--	3 Hours All Races
--	Vitality +3
--	Intelligence -2
--	Defense +10% (Cap: 30?@??? Base Defense)
--	Accuracy +10% (Cap: ??@??? Base Accuracy)
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
		user:addStatusEffect(EFFECT_FOOD,5750,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5750,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 