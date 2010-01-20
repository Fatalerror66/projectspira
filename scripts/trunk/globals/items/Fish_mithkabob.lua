-----------------------------------
--	Author: Bababooey
-- 	Fish Mithkabob
-- 	Mithra love this tasty fish-on-a-stick meal. 
--
--	http://wiki.ffxiclopedia.org/wiki/Fish_Mithkabob
--	
--	30 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	Mind -1
--	Defense +25% (Cap: 90@360 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4398,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4398,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 