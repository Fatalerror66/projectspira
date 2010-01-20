-----------------------------------
--	Author: Bababooey
--	Pamamas
--	This nutritious fruit is favored by the Mithra.
--
--	http://wiki.ffxiclopedia.org/wiki/Pamamas
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
		user:addStatusEffect(EFFECT_FOOD,4468,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4468,1,0,1800); --Adds effects specific to this food.
	end
end;
