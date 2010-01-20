-----------------------------------
--	Author: Bababooey
-- 	Meat Chiefkabob
-- 	A high-quality meat mithkabob worthy to be eaten by the Mithra
--	chieftainness.  
--
--	http://wiki.ffxiclopedia.org/wiki/Meat_Chiefkabob
--
--	60 Minutes, All Races
--	Strength +5
--  Agility +1
--	Intelligence -2
--  Attack +22% (Cap: 65@295 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4574,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4574,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 