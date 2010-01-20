-----------------------------------
--	Author: Bababooey
-- 	Rattatouille +1
-- 	Marvelously stewed, masterfully seasoned, perfectly chilled ratatouille. 
--
--	http://wiki.ffxiclopedia.org/wiki/Ratatouille_%2B1
--	
--	4 Hours, All Races
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
		user:addStatusEffect(EFFECT_FOOD,5732,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5732,1,0,14400); --Adds effects specific to this food.
	end;
end; 
 
 
 