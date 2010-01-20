-----------------------------------
--	Author: Bababooey
--	Pogaca
--	A crispy, yogurt-flavored bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Pogaca
--
--	5 Minutes, All Races
--	HP Recovered while healing +4
--	MP Recovered while healing +4
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
		user:addStatusEffect(EFFECT_FOOD,5637,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5637,1,0,300); --Adds effects specific to this food.
	end
end;
