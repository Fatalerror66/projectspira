-----------------------------------
--	Author: Bababooey
--	Peperoncino
--	A simple pasta dish made with olive oil and peppers.
--
--	http://wiki.ffxiclopedia.org/wiki/Peperoncino
--
--	30 Minutes, All Races
--	Vitality +2
--	HP +30% (Cap: 70@233 Base HP)
--	Store TP +5
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
		user:addStatusEffect(EFFECT_FOOD,5188,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5188,1,0,1800); --Adds effects specific to this food.
	end
end;
