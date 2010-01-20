-----------------------------------
--	Author: Bababooey
--	Black Bread
--	This bread is made from rye flour.
--
--	http://wiki.ffxiclopedia.org/wiki/Black_Bread
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +2
--	HP +8
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
		user:addStatusEffect(EFFECT_FOOD,4364,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4364,1,0,1800); --Adds effects specific to this food.
	end
end;
