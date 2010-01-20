-----------------------------------
--	Author: Bababooey
--	White Bread
--	This bread is made from San d'Orian wheat.
--
--	http://wiki.ffxiclopedia.org/wiki/White_Bread
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +3
--	HP +16
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
		user:addStatusEffect(EFFECT_FOOD,4356,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4356,1,0,1800); --Adds effects specific to this food.
	end
end;
