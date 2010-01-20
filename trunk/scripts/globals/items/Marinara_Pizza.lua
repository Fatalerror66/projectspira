-----------------------------------
--	Author: Bababooey
--	Marinara Pizza
--	A classic pizza recipe using a zesty marinara sauce, and topped with
--	delectable chunks of fish and seafood
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara_Pizza
--
--	3 Hours, All Races
--	HP +20
--	Attack +20% (Cap: 50@250 Base Attack)
--	Accuracy +10% (Cap: 40@400 Base Accuracy)
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
		user:addStatusEffect(EFFECT_FOOD,5743,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5743,1,0,10800); --Adds effects specific to this food.
	end
end;
