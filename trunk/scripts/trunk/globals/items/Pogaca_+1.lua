-----------------------------------
--	Author: Bababooey
--	Pogaca +1
--	75% crispier than the leading pogaca.
--
--	http://wiki.ffxiclopedia.org/wiki/Pogaca_%2B1
--
--	6 Minutes, All Races
--	HP Recovered while healing +6
--	MP Recovered while healing +6
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
		user:addStatusEffect(EFFECT_FOOD,5638,0,360); --Adds the "has food" effect.
		user:addStatusEffect(5638,1,0,360); --Adds effects specific to this food.
	end
end;
