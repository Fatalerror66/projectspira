-----------------------------------
--	Author: Bababooey
--	Napa
--	A Far Eastern vegetable with edible leaves.
--
--	http://wiki.ffxiclopedia.org/wiki/Napa
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -3
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
		user:addStatusEffect(EFFECT_FOOD,5235,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5235,1,0,300); --Adds effects specific to this food.
	end
end;
