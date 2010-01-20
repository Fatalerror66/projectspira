-----------------------------------
--	Author: Bababooey
--  Viking Herring
--  The scurviest pirates of the north seas have given this 
--	pickled herring their seal of approval.
--
--	http://wiki.ffxiclopedia.org/wiki/Viking_Herring
--	
--	60 Minutes, All Races
--	Dexterity +4
--	Mind -3
--	Attack +12%
--	Ranged Attack +12%
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
		user:addStatusEffect(EFFECT_FOOD,5183,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5183,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 