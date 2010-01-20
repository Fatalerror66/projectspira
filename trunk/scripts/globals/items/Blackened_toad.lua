-----------------------------------
--	Author: Bababooey
-- 	Blackened Toad
-- 	This rare toad has been roasted until it has turned black.
--
--	http://wiki.ffxiclopedia.org/wiki/Blackened_Toad
--	3 hours, All Races
--  Dexterity +2
--	Agility +2
--  Mind -1
--	Resist Poison
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
		user:addStatusEffect(EFFECT_FOOD,4599,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4599,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 