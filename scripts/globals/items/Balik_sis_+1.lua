-----------------------------------
--	Author: Bababooey
-- 	Balik Sis +1
-- 	Just looking at this balik sis makes your mouth water.  
--
--	http://wiki.ffxiclopedia.org/wiki/Balik_Sis_%2B1
--	
--
--	60 Minutes, All Races
--	Dexterity +4
--	Mind -2
--	Attack +13% (Cap: ???) (BABABOOEY-Probably 70)
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
		user:addStatusEffect(EFFECT_FOOD,5601,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5601,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 