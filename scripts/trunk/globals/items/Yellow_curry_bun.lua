-----------------------------------
--	Author: Bababooey
-- 	Yellow Curry Bun
-- 	A crispy fried bun with a tangy yellow curry filling.
--
--	http://wiki.ffxiclopedia.org/wiki/Yellow_Curry_Bun
--
--	30 Minutes, All Races
--	HP +25
--	Strength +5
--	Agility +2
--	Intelligence -2
--	Attack +20% (Cap: 75@375 Base Attack) 
--	Ranged Attack +20% (Cap: 75@375 Base Ranged Attack) 
--	hidden effect : attack caps at 85 when eaten in a party of 4 or more. 
--	The effect does not wear off upon disbanding.
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
		user:addStatusEffect(EFFECT_FOOD,5757,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5757,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 