-----------------------------------
--	Author: Bababooey
--	Salmon Rice Ball
--	This rice ball has salmon packed inside.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Rice_Ball
--
--	30 Minutes, All Races
--	Dexterity +2
--	Vitality +2
--	Mind -1
--	HP Recovered while healing +1
--	HP +25
--	Attack +40
--	Defense +40
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
		user:addStatusEffect(EFFECT_FOOD,4590,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4590,1,0,1800); --Adds effects specific to this food.
	end
end;
