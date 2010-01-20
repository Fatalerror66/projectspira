-----------------------------------
--	Author: Bababooey
-- 	Porcupine Pie
-- 	Serve this mouthwatering hedgehog pie	at any family gathering and it will be
--	gone faster than you can say "sonic." 
--
--	http://wiki.ffxiclopedia.org/wiki/Porcupine_Pie
--	
--	4 Hours, All Races
--	HP +55
--	Strength +6
--	Vitality +2
--	Intelligence -3
--	Mind +3
--	MP Recovered while healing +2
--	Accuracy +5
--	Attack +18% (Cap: 95@527 Base Attack)
--	Ranged Attack +18% (Cap: 95@527 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5156,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5156,1,0,14400); --Adds effects specific to this food.
	end;
end; 
 
 
 