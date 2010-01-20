-----------------------------------
--	Author: Bababooey
-- 	Fish Chiefkabob
-- 	A high-quality fish mithkabob worthy to be eaten by the Mithra
--	chieftainness. 
--
--	http://wiki.ffxiclopedia.org/wiki/Fish_Chiefkabob
--	
--	60 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	Mind -1
--	Defense +25% (Cap: 95@380 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,4575,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4575,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 