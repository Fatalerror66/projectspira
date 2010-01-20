-----------------------------------
--	Author: Bababooey
--  Pickled Herring
--  A pickled nosteau herring. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pickled_Herring
--	
--	30 Minutes, All Races
--	Dexterity +3
--	Mind -3
--	Attack +12%
--	Ranged Attack +12%
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
		user:addStatusEffect(EFFECT_FOOD,4490,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4490,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 