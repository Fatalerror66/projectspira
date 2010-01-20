-----------------------------------
--	Author: Bababooey
-- 	Red Curry Bun
-- 	A crispy fried bun with an aromatic red curry filling.
--
--	http://wiki.ffxiclopedia.org/wiki/Red_Curry_Bun
--
--	30 Minutes, All Races
--	HP +25
--	Strength +7
--	Agility +1
--	Intelligence -2
--	Attack +24.7% (Cap: 150@652 Base Attack) 
--	Ranged Attack +24.7% (Cap: 75@375 Base Ranged Attack) 
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
		user:addStatusEffect(EFFECT_FOOD,5759,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5759,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 