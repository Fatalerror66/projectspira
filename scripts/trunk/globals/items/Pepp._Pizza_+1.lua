-----------------------------------
--	Author: Bababooey
--	Pepperoni Pizza +1
--	The width of pepperoni slices, the consistency of the crust, the
--	proportion of sauce to cheese. It's all here.
--
--	http://wiki.ffxiclopedia.org/wiki/Pepperoni_Pizza_%2B1
--
--	4 Hours, All Races
--	Strength +1
--	HP +30
--	Attack +5% (Cap: 15@331 Base Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5698,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5698,1,0,14400); --Adds effects specific to this food.
	end
end;
