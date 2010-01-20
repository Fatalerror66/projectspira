-----------------------------------
--	Author: Bababooey
-- 	Cibariuos Cilbir
-- 	The eggs in this exotic dish have been poached to perfection. 
--
--	http://wiki.ffxiclopedia.org/wiki/Cibarious_Cilbir
--	
-- 	UNKNOWN
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
		user:addStatusEffect(EFFECT_FOOD,5643,0,30); --Adds the "has food" effect.
		user:addStatusEffect(5643,1,0,30); --Adds effects specific to this food.
	end
end; 
 
 
 