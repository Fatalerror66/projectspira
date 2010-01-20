-----------------------------------
--	Author: Bababooey
--	Dragon Fruit
--	Covered in soft green barbs, this cactus fruit has a sweet, tangy flavor.
--
--	http://wiki.ffxiclopedia.org/wiki/Dragon_Fruit
--
--	5 Minutes, All Races
--	Agility -6
--	Intelligence +4
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
		user:addStatusEffect(EFFECT_FOOD,5662,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5662,1,0,300); --Adds effects specific to this food.
	end
end;
