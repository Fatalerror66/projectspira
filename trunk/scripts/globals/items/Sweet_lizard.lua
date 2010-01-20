-----------------------------------
--	Author: Bababooey
-- 	Sweet Lizard
--  An incredibly simple dish made by roasting lizard tail basted with honey. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sweet_Lizard
--	
--	30 Minutes, All Races
--	HP +5
--	MP +5
--	Dexterity +1
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
		user:addStatusEffect(EFFECT_FOOD,5738,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5738,1,0,1800); --Adds effects specific to this food.
	end;
end; 
 
 
 