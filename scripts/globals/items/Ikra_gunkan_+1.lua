-----------------------------------
--	Author: Bababooey
--	Ikra Gunkan +1
-- 	This plate of ikra gunkan looks so delicious, even the kids will eat it. 
--
--	http://wiki.ffxiclopedia.org/wiki/Ikra_Gunkan_%2B1
--	
--	60 Minutes, All Races
--	HP +30
--	MP +12
--	Dexterity +3
--	Mind -1
--	Accuracy +17% (Cap: 30@176)
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
		user:addStatusEffect(EFFECT_FOOD,5220,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5220,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 