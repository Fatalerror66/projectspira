-----------------------------------
--	Author: Bababooey
--	Arrabbiata +1
--	Only a master's hand could produce such a perfect balance of ingredients.
--
--	http://wiki.ffxiclopedia.org/wiki/Arrabbiata_%2B1
--
--	60 Minutes, All Races
--	Strength +5
--	Vitality +2
--	Intelligence -7
--	HP +12% (Cap: 150@1250 Base HP)
--	Attack +23% (Cap: 120@533 Base Attack)
--	Store TP +5
-----------------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);

	effect = user:getStatusEffect(EFFECT_FOOD);

	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5212,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5212,1,0,3600); --Adds effects specific to this food.
	end
end;
