-----------------------------------
--	Author: Bababooey
--	Melanzane
--	A pasta dish made from a tasteful blend of eggplants and tomato sauce.
--
--	http://wiki.ffxiclopedia.org/wiki/Melanzane
--
--	30 Minutes, All Races
--	Vitality +2
--	HP +25% (Cap: 100@400 Base HP)
--	Store TP +4
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
		user:addStatusEffect(EFFECT_FOOD,5213,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5213,1,0,1800); --Adds effects specific to this food.
	end
end;
