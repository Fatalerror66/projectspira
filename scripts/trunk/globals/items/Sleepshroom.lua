-----------------------------------
--	Author: Bababooey
--	Sleepshroom
--	An edible mushroom that grows on funguar.
--
--	http://wiki.ffxiclopedia.org/wiki/Sleepshroom
--
--	5 Minutes, All Races
--	Strength -3
--	Mind +1
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
		user:addStatusEffect(EFFECT_FOOD,4374,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4374,1,0,300); --Adds effects specific to this food.
	end
end;
