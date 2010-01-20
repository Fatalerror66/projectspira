-----------------------------------
--	Author: Bababooey
--  Sopa Pez Blanco
-- 	The whitefish in this stew is as white as snow. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sopa_Pez_Blanco
--
--	3 Hours, All Races
--	HP +12
--	Dexterity +6
--	Mind -4
--	Accuracy +3
--	Ranged Accuracy +7% (Cap: 10)
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
		user:addStatusEffect(EFFECT_FOOD,4601,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4601,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 