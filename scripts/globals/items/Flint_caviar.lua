-----------------------------------
--	Author: Bababooey
-- 	Flint Caviar
-- 	The salted roe of the emperor fish are also known as "Black Diamonds."
--
--	http://wiki.ffxiclopedia.org/wiki/Flint_Caviar
--	
--	30 Minutes, All Races
--	HP +10
--	MP +10
--	Dexterity +4
--	Mind -1
--	Charisma +4
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
		user:addStatusEffect(EFFECT_FOOD,4276,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4276,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 