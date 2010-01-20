----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Mille Feuille
--
--	A Windurstian cake made by stacking
--  thin slices of pie crust to symbolize
--  the leaves of the Great Star Tree  
--  
--  http://wiki.ffxiclopedia.org/wiki/Mille_Feuille
--
--  3 hours, All Races
--  Group Effects
--  HP Recovered while healing +1
--  MP Recovered while healing +1
--  HP +8
--  MP +15
--  INT +1
-------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5559,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5559,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 