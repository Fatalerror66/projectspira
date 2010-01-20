-----------------------------------
--	Author: Bababooey
-- 	Baked Popoto
-- 	A popoto baked in its skin.
--
--	http://wiki.ffxiclopedia.org/wiki/Baked_Popoto
--	
--	30 Minutes, All Races
--	HP +20
--	Dexterity -1
--	Vitality +2
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
		user:addStatusEffect(EFFECT_FOOD,4436,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4436,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 