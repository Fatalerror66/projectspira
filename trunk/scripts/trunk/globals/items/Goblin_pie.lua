-----------------------------------
--	Author: Bababooey
-- 	Goblin Pie
-- 	A traditional pie of the Goblins.
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Pie
--	
--	30 Minutes, All Races
--	HP +12
--	MP +12
--	Dexterity -1
--	Vitality -1
--	Agility +3
--	Charisma -5
--	Defense +9%
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
		user:addStatusEffect(EFFECT_FOOD,4539,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4539,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 