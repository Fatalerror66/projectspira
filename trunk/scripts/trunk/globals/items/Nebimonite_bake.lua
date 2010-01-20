-----------------------------------
--	Author: Bababooey
--  Nebimonite Bake
-- 	A nebimonite baked right in its shell. 
--
--	http://wiki.ffxiclopedia.org/wiki/Nebimonite_Bake
--	
--	30 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	Defense +25% (Cap: 70@280 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4459,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4459,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 