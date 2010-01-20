-----------------------------------
--	Author: Bababooey
--	Wild Pamamas
--	These pamamas grow wild on the island of Elshimo.
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Pamamas
--
--	30 Minutes, All Races
--	Strength -3
--	Intelligence +1
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
		user:addStatusEffect(EFFECT_FOOD,4596,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4596,1,0,1800); --Adds effects specific to this food.
	end
end;
