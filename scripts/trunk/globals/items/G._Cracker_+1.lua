-----------------------------------
--	Author: Bababooey
--	Garlic Cracker +1
--	Now with 32% more garlic! Do not eat these potent crackers before a date.
--
--	http://wiki.ffxiclopedia.org/wiki/Garlic_Cracker_%2B1
--
--	5 Minutes, All Races
--	HP Recovered while healing +8
--	Resist Blind
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
		user:addStatusEffect(EFFECT_FOOD,4280,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4280,1,0,300); --Adds effects specific to this food.
	end
end;
