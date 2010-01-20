-----------------------------------
--	Author: Bababooey
--	Rice Ball
--	This snack is made by shaping steamed Tarutaru rice into a ball.
--
--	http://wiki.ffxiclopedia.org/wiki/Rice_Ball
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +2
--	HP Recovered while healing +1
--	HP +10
--	Defense +50
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
		user:addStatusEffect(EFFECT_FOOD,4405,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4405,1,0,1800); --Adds effects specific to this food.
	end
end;
