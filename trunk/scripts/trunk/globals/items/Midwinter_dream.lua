-----------------------------------
--	Author: Psy aka psyclosis
--  Midwinter dream
--
--	A Bastokan cake made for
--  the Starlight Celebration.
--  Symbolizes the fire of civilization,
--  come to melt away the snow.     
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Midwinter_Dream
--
--  4 hours, All Races
--  Group Effects
--  MP Recovered while healing +2
--  MP +9% (cap:60@666 Base MP)
--  HP +10
--  INT +2
------------------------------
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5543,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5543,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 