-----------------------------------
--	Author: Bababooey
--	Marinara Pizza +1
--	Ahoy there, captain! You've hauled in the ultimate in
--	seafood pizzas, simply loaded with succulent morsels of only the
--	finest ocean delights.
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara_Pizza_%2B1
--
--	4 Hours, All Races
--	HP +25
--	Attack +21% (Cap: 55)
--	Accuracy +11% (Cap: 44)
--	Undead Killer
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
		user:addStatusEffect(EFFECT_FOOD,5744,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5744,1,0,14400); --Adds effects specific to this food.
	end
end;
