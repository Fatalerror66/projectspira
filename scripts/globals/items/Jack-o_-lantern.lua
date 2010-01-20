-----------------------------------
--	Author: Bababooey
-- 	Jack-o'-Lantern
-- 	An artfully carved ogre pumpkin. Given as a present.
--
--	http://wiki.ffxiclopedia.org/wiki/Jack-o%27-Lantern
--	
--	3 Hours, All Races
--	Charisma -10
--	Resist Dark +25
--	Accuracy +10
--	Evasion +10
--	Arcana Killer
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
		user:addStatusEffect(EFFECT_FOOD,4488,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4488,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 