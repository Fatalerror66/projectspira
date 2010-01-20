-----------------------------------
--	Author: Bababooey
--  Witch Soup
-- 	This mushroom soup has been bewitched. 
--
--	http://wiki.ffxiclopedia.org/wiki/Witch_Soup
--
--	4 Hours, All Races
--	MP +25
--	Strength -1
--	Mind +2
--	HP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,4333,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4333,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 