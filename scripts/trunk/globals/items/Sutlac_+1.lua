-----------------------------------
--	Author: Psy aka psyclosis
-- Bowl of Sutlac +1
-- 
--	Only a master patissier could have
--  made this exceptionally delicious
--  serving of sutlac.   
--
--	http://wiki.ffxiclopedia.org/wiki/Sutlac_%2B1
-- 
--  4 Hours, All Races
--  Group Food
--  MP +10
--  Intelligence +2
--  MP Recovered while healing +2
--  HP +10
----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5578,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5578,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 