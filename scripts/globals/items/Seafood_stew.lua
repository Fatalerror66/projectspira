-----------------------------------
--	Author: Bababooey
-- 	Seafood Stew
-- 	This rich stew is made with a variety of seafood.  
--
--	http://wiki.ffxiclopedia.org/wiki/Seafood_Stew
--
--	3 Hours, All Races
--	HP +20
--	Dexterity +1
--	Vitality +5
--	Defense +25% (Cap: 120@480 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4561,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4561,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 