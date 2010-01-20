-----------------------------------
--	Author: Bababooey
-- 	Flounder Meuniere +1
-- 	This flounder meuniere will make your mouth water.
--
--	http://wiki.ffxiclopedia.org/wiki/Flounder_Meuniere%2B1
--	
--	4 Hours, All Races
--	Dexterity +6
--	Mind -1
--	Vitality +1
--	Ranged Accuracy +15
--	Ranged Attack +14% (Cap: 30@214 Base Ranged Attack)
--	Enmity -3
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
		user:addStatusEffect(EFFECT_FOOD,4345,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4345,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 