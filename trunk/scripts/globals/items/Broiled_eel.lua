-----------------------------------
--	Author: Bababooey
-- 	Broiled Eel
-- 	An exceptionally delicious black eel on a stick. 
--
--	http://wiki.ffxiclopedia.org/wiki/Broiled_Eel
--	
--	60 Minutes, All Races
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
		user:addStatusEffect(EFFECT_FOOD,4588,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4588,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 