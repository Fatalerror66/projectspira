-----------------------------------
--	Author: Bababooey
-- 	Goblin Mushpot
-- 	Goblin hotpots contain many kinds of mushrooms. Proper etiquette 
--	is to eat only one kind at a time.
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Mushpot
--	
--	3 Hours, All Races
--	Mind +10
--	Charisma -5
--	Resist Poison
--	Resist Blind
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
		user:addStatusEffect(EFFECT_FOOD,4543,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4543,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 