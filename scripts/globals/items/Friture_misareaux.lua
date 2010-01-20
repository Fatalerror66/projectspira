-----------------------------------
--	Author: Bababooey
-- 	Friture Misareaux
-- 	Named after the "Tragedy of Misareaux" where five died of
--	bliss after eating a terribly scrumptious basket of fish and chips.
--
--	http://wiki.ffxiclopedia.org/wiki/Friture_Misareaux
--	
--	4 Hours, All Races
--	Dexterity +3
--	Vitality +3
--	Mind -3
--	Defense +5% 
--	Ranged Attack +7% (Cap: 15@214 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5159,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5159,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 