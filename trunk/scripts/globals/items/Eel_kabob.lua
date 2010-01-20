-----------------------------------
--	Author: Bababooey
-- 	Eel Kabob
-- 	A black eel roasted on a stick. Can also be made with a yilanbaligi. 
--
--	http://wiki.ffxiclopedia.org/wiki/Eel_Kabob
--	
--	30 Minutes, All Races
--	Dexterity +4
--	Mind -3
--	Evasion +5
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
		user:addStatusEffect(EFFECT_FOOD,4457,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4457,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 