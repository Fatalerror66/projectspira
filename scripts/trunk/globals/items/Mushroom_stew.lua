-----------------------------------
--	Author: Bababooey
--  Mushroom Stew
-- 	A thick soup of stewed mushrooms. 
--
--	http://wiki.ffxiclopedia.org/wiki/Mushroom_Stew
--
--	3 Hours, All Races
--	MP +40
--	Strength -1
--	Mind +4
--	MP Recovered while healing +4
--	Enmity -4
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
		user:addStatusEffect(EFFECT_FOOD,4544,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4544,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 