-----------------------------------
--	Author: Bababooey
-- 	Windurst Salad
-- 	This traditional Tarutaru salad is made with a variety of vegetables.
--
--	http://wiki.ffxiclopedia.org/wiki/Windurst_Salad
--	
--	3 Hours, All Races
--	MP +20
--	Vitality -1
--	Agility +5
--	Ranged Accuracy +8% (Cap: 10@125)
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
		user:addStatusEffect(EFFECT_FOOD,4555,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4555,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 