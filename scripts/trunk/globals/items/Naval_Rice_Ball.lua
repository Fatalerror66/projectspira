-----------------------------------
--	Author: Bababooey
--	Naval Rice Ball
--	This salmon rice ball has been made to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Naval_Rice_Ball
--
--	30 Minutes, All Races
--	Dexterity +3
--	Vitality +3
--	HP Recovered while healing +2
--	HP +26
--	Attack +40
--	Defense +40
--	Arcana Killer
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
		user:addStatusEffect(EFFECT_FOOD,4605,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4605,1,0,1800); --Adds effects specific to this food.
	end
end;
