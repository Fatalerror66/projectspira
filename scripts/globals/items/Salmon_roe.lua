-----------------------------------
--	Author: Bababooey
-- 	Salmon Roe
--  Salmon eggs pickled in salt, this delicacy is sometimes referred to as "red gold."
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Roe
--	
--	30 Minutes, All Races
--	HP +8
--	MP +8
--	Dexterity +2
--	Mind -1
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
		user:addStatusEffect(EFFECT_FOOD,5218,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5218,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 