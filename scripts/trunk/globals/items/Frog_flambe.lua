-----------------------------------
--	Author: Bababooey
-- 	Frog Flambe
-- 	Not your ordinary blackened frog. 
--
--	http://wiki.ffxiclopedia.org/wiki/Frog_Flambe
--	
--	60 Minutes, All Races
--	Dexterity +3
--	Agility +2
--	Mind -2
--	Attack +14% (Cap: 65@464 Base Attack)
--	Ranged Attack +20% (Cap: ???)
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
		user:addStatusEffect(EFFECT_FOOD,4326,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4326,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 