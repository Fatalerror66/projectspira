-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Snowy Rolanberry
--
--	This icecap rolanberry is exceptionally delicious. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Snowy_Rolanberry
--  4 hrs, All Races
--  INT +2
--  MP +18%(cap:60@~333 BASE MP)
--  Wind Resist +5
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
		user:addStatusEffect(EFFECT_FOOD,4594,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4594,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 