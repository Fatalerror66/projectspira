-----------------------------------
--	Author: Bababooey
--	Tavnazian Taco
-- 	A simple snack consisting of Tavnazian salad wrapped in a warm tortilla.
--
--	http://wiki.ffxiclopedia.org/wiki/Tavnazian_Taco
--	
--	30 Minutes, All Races
--	HP +20
--	MP +20
--	Dexterity +4
--	Vitality +6
--	Charisma +4
--	Agility +4
--	HP Recovered while healing +1
--	MP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,5174,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5174,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 