-----------------------------------
--	Author: Bababooey
-- 	Goulash +1
-- 	A savory bowl of goulash so piping hot that it could warm the bones 
--	of any Bastoker on even the coldest nights. A particularly favored 
--	dish among the Republic's musketeers.
--
--	http://wiki.ffxiclopedia.org/wiki/Goulash_%2B1
--
--	4 Hours All Races
--	Vitality +3
--	Intelligence -2
--	Defense +11% (Cap: 35?@??? Base Defense)
--	Accuracy +11% (Cap: ??@??? Base Accuracy)
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
		user:addStatusEffect(EFFECT_FOOD,5751,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5751,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 