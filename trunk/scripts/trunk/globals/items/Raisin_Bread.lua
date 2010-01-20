-----------------------------------
--	Author: Bababooey
--	Raisin Bread
--	A sweet bread made from sun-dried San d'Orian grapes.
--
--	http://wiki.ffxiclopedia.org/wiki/Raisin_Bread
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +4
--	HP +20
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
		user:addStatusEffect(EFFECT_FOOD,4546,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4546,1,0,1800); --Adds effects specific to this food.
	end
end;
