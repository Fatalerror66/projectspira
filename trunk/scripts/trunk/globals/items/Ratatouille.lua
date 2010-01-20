-----------------------------------
--	Author: Bababooey
-- 	Rattatouille
-- 	Staple of the Royal Army, this refreshing dish is a hodgepodge of
--	stewed vegetables, chilled before serving.   
--
--	http://wiki.ffxiclopedia.org/wiki/Ratatouille
--	
--	3 Hours, All Races
--	Agility +5
--	Evasion +5
--	HP Recovered while healing +2
--	Undead Killer
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
		user:addStatusEffect(EFFECT_FOOD,5731,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5731,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 