-----------------------------------
--	Author: Bababooey
-- 	Blackened Frog
-- 	A copper frog, roasted black.
--
--	http://wiki.ffxiclopedia.org/wiki/Blackened_Frog
--	30 minutes, All Races
--	Dexterity +2
--  Agility +2
--	Mind -2
--  Attack +14% (Cap: 60@428 Base Attack)
--	Ranged Attack +20% (Cap: ???)
-- 	Evasion +5
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
		user:addStatusEffect(EFFECT_FOOD,4536,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4536,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 