-----------------------------------
--	Author: Bababooey
-- 	Tavnazian Salad
-- 	Seafood graces this salad loved by pirates everywhere.
--
--	http://wiki.ffxiclopedia.org/wiki/Tavnazian_Salad
--	
--	3 Hours, All Races
--	HP +20
--	MP +20
--	Dexterity +4
--	Vitality +6
--	Agility +4
--	Charisma +4
--	Defense +25% (Cap: 150@600 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4279,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4279,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 