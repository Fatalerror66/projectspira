-----------------------------------
--	Author: Bababooey
--	Shrimp Cracker +1
--	If you like shrimp, then you'll love this flavorful shrimp cracker.
--
--	http://wiki.ffxiclopedia.org/wiki/Shrimp_Cracker_%2B1
--
--	5 Minutes, All Races
--	Vitality +2
--	HP Recovered while healing +9
--	Amorph Killer
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
		user:addStatusEffect(EFFECT_FOOD,5636,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5636,1,0,300); --Adds effects specific to this food.
	end
end;
