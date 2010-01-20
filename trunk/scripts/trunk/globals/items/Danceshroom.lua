-----------------------------------
--	Author: Bababooey
--	Danceshroom
--	An edible mushroom that grows on funguar.
--
--	http://wiki.ffxiclopedia.org/wiki/Danceshroom
--
--	5 Minutes, All Races
--	Strength -5
--	Mind +3
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
		user:addStatusEffect(EFFECT_FOOD,4375,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4375,1,0,300); --Adds effects specific to this food.
	end
end;
