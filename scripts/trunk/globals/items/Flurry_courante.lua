-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Flurry Courante
--
--	Made by a master patissier, the taste
--  of this gleaming icecap rolanberry
--  will make you dance with joy.  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Flurry_Courante
--  4 hrs, All Races
--  INT +2
--  MP +19%(cap:65@~342 BASE MP)
--  Wind Resist +5
--  MP Recovered while healing +1
--------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5555,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5555,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 