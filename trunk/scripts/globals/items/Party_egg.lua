-----------------------------------
--	Author: Bababooey
-- 	Party Egg
-- 	This colored egg is brighter and more vivid than ever. 
--
--	http://wiki.ffxiclopedia.org/wiki/Party_Egg
--	
--	60 Minutes, All Races
--	HP +25
--	MP +25
--	Attack +5
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
		user:addStatusEffect(EFFECT_FOOD,4595,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4595,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 