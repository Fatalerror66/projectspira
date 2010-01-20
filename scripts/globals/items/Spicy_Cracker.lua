-----------------------------------
--	Author: Bababooey
--	Spicy Cracker
--	A traditional rice cracker from a land far to the east.
--
--	http://wiki.ffxiclopedia.org/wiki/Spicy_Cracker
--
--	3 Minutes, All Races
--	HP Recovered while healing +7
--	Resist Sleep
--	Beast Killer
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
		user:addStatusEffect(EFFECT_FOOD,4466,0,180); --Adds the "has food" effect.
		user:addStatusEffect(4466,1,0,180); --Adds effects specific to this food.
	end
end;
