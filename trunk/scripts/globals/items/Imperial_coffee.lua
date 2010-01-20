-----------------------------------
--	Author: Bababooey
--	Imperial Coffee
--	Strong coffee brewed in Al Zahbi.
--
--	http://wiki.ffxiclopedia.org/wiki/Imperial_Coffee
--
--	3 Hours, All Races
--	HP Recovered while healing +3
--	MP Recovered while healing +3
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
		user:addStatusEffect(EFFECT_FOOD,5592,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5592,1,0,10800); --Adds effects specific to this food.
	end
end;
