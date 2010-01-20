-----------------------------------
--	Author: Bababooey
-- 	Hobgoblin Pie
-- 	This strangely baked Goblin pie looks burnt in some places. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hobgoblin_Pie
--	
--	60 Minutes, All Races
--	HP +15
--	MP +15
--	Agility +4
--	Charisma -7
--	Defense +11% (Cap 60@545 Base Defense)
--	HP Recovered while healing +2
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
		user:addStatusEffect(EFFECT_FOOD,4325,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4325,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 