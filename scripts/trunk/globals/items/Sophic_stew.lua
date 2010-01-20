-----------------------------------
--	Author: Bababooey
-- 	Sophic Stew
-- 	This savory brain stew will make you wonder how you would settle
--	for anything less.
--
--	http://wiki.ffxiclopedia.org/wiki/Sophic_Stew
--
--	4 Hours, All Races
--	Dexterity +6
--	Intelligence +6
--	Mind +6
--	HP Recovered while healing +3
--	MP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,5180,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5180,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 