-----------------------------------
--	Author: Bababooey
-- 	Boiler Tuna Head
-- 	A boiled Gugru tuna head. 
--
--	http://wiki.ffxiclopedia.org/wiki/Boiled_Tuna_Head
--	
--	3 Hours, All Races
--	MP +20
--	Dexterity +3
--	Intelligence +4
--	Mind -3
--	MP Recovered while healing +2
--	Accuracy +5
--	Evasion +5
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
		user:addStatusEffect(EFFECT_FOOD,4540,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4540,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 