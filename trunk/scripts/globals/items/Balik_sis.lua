-----------------------------------
--	Author: Bababooey
-- 	Balik Sis
-- 	Fish meat and tomatoes on a skewer. Popular in the Near East. 
--
--	http://wiki.ffxiclopedia.org/wiki/Balik_Sis
--	
--
--	30 Minutes, All Races
--	Dexterity +4
--	Mind -2
--	Attack +13% (Cap: 65)
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
		user:addStatusEffect(EFFECT_FOOD,5600,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5600,1,0,1800); --Adds effects specific to this food.
	end
end; 
 
 
 