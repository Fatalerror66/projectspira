-----------------------------------
--	Author: Bababooey
-- 	Salmon Eggs
--  These eggs of the freshwater Cheval salmon
--	are said to be a rare delicacy.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Eggs
--	
--	5 Minutes, All Races
--	HP +6
--	MP +6
--	Dexterity +2
--	Mind -3
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
		user:addStatusEffect(EFFECT_FOOD,5217,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5217,1,0,300); --Adds effects specific to this food.
	end
end; 
 
 
 