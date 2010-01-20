-----------------------------------
--	Author: Bababooey
--  Nashmau Stew
-- 	Seafood stew made by a Qiqirn.
--
--	http://wiki.ffxiclopedia.org/wiki/Nashmau_Stew
--
--	3 Hours, All Races
--	Group Food Effects
--	MP -100
--	Vitality -10
--	Agility -10
--	Intelligence -10
--	Mind -10
--	Charisma -10
--	Accuracy +15% (Cap: 25@166 Base Accuracy)
--	Attack +18% (Cap: 60@333 Base Attack)
--	Defense -100
--	Evasion -100
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
		user:addStatusEffect(EFFECT_FOOD,5595,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5595,1,0,10800); --Adds effects specific to this food.
	end
end; 
 
 
 