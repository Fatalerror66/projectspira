-----------------------------------
--	Author: Bababooey
--	Tonno Rosso
--	A pasta dish made with tuna and tomato sauce.
--
--	http://wiki.ffxiclopedia.org/wiki/Tonno_Rosso
--
--	30 Minutes, All Races
--	Dexterity +1
--	Vitality +2
--	HP +13% (Cap: 180@1400 Base HP)
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
		user:addStatusEffect(EFFECT_FOOD,5623,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5623,1,0,1800); --Adds effects specific to this food.
	end
end;
