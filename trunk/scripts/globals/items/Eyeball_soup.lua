-----------------------------------
--	Author: Bababooey
-- 	Eyeball Soup
-- 	The eyeballs that give this soup its name are taken from the hecteyes. 
--
--	http://wiki.ffxiclopedia.org/wiki/Eyeball_Soup
--
--	3 Hours All Races
--	HP +6% (Cap: 70@116 Base HP)
--  Charisma -10
--  HP Recovered while healing +4
--  Accuracy +12
--  Ranged Accuracy +12
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
		user:addStatusEffect(EFFECT_FOOD,4453,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4453,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 