-----------------------------------
--	Author: Bababooey
--  Witch Stew
-- 	This bowl of mushroom stew has been bewitched. 
--
--	http://wiki.ffxiclopedia.org/wiki/Witch_Stew
--
--	4 Hours, All Races
--	MP +45
--	Strength -1
--	Mind +4
--	MP Recovered while healing +4
--	Enmity -4
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
		user:addStatusEffect(EFFECT_FOOD,4344,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4344,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 