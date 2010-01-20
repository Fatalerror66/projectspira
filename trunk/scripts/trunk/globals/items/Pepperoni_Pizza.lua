-----------------------------------
--	Author: Bababooey
--	Pepperoni Pizza
--	A layer of pepperoni separates the cheese above from the sauce below. A
--	mainstay of any pizza repertoire.
--
--	http://wiki.ffxiclopedia.org/wiki/Pepperoni_Pizza
--
--	3 Hours, All Races
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
		user:addStatusEffect(EFFECT_FOOD,5697,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5697,1,0,10800); --Adds effects specific to this food.
	end
end;
