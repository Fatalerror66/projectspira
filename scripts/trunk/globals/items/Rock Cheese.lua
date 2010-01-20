-----------------------------------
--	Author: Bababooey
--	Rock Cheese
--	This cheese is even harder than stone cheese.
--
--	http://wiki.ffxiclopedia.org/wiki/Rock_Cheese
--
--	60 Minutes, All Races
--	HP Recovered while healing +1
--	HP +6% (Cap: 45)
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
		user:addStatusEffect(EFFECT_FOOD,4593,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4593,1,0,3600); --Adds effects specific to this food.
	end
end;
