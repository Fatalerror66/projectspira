-----------------------------------
--	Author: Bababooey
-- 	Emperor Roe
-- 	The eggs of the legendary emperor fish are prized for their flavor. 
--
--	http://wiki.ffxiclopedia.org/wiki/Emperor_Roe
--	
--	30 Minutes, All Races
--	HP +8
--	MP +8
--	Dexterity +4
--	Mind -4
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
		user:addStatusEffect(EFFECT_FOOD,4275,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4275,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 