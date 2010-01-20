-----------------------------------
--	Author: Bababooey
-- 	Humpty Soup
-- 	This egg soup is truly delicious. 
--
--	http://wiki.ffxiclopedia.org/wiki/Humpty_Soup
--
--	4 Hours, All Races
--	HP +5.5% (Cap: 35@636 Base HP)
--	MP +5
--	HP Recovered while healing +5
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
		user:addStatusEffect(EFFECT_FOOD,4521,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4521,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 