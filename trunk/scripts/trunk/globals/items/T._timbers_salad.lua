-----------------------------------
--	Author: Bababooey
-- 	Timbre Timbers Salad
-- 	This special tossed salad is an exact replica of the one 
--	served at the Timbre Timbers Tavern in Windurst.
--
--	http://wiki.ffxiclopedia.org/wiki/Timbre_Timbers_Salad
--	
--	4 Hours, All Races
--	MP +20
--	Vitality -1
--	Agility +5
--	Ranged Accuracy +8% (Cap: 15@188)
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
		user:addStatusEffect(EFFECT_FOOD,4321,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4321,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 