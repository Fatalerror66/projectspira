-----------------------------------
--	Author: Bababooey
-- 	Wisdom Soup
-- 	A bowl of stone soup with "that little extra something" added.
--
--	http://wiki.ffxiclopedia.org/wiki/Wisdom_Soup
--
--	4 Hours, All Races
--	HP +3
--	MP +3
--	Strength +1
--	Dexterity +1
--	Agility +1
--	Vitality +1
--	Intelligence +1
--	Mind +1
--	Charisma +1
--	HP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,4592,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4592,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 