-----------------------------------
--	Author: Bababooey
--	Buffalo Meat
--	A succulent slab of fresh buffalo meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Buffalo_Meat
--
--	5 Minutes, Galka Only
--	Strength +4
--	Agility -5
--	Intelligence -7
-----------------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);

	effect = user:getStatusEffect(EFFECT_FOOD);
	notgalkan = (player.getRace() ~= 8);
	
	if (effect ~= nil) or notgalkan then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5152,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5152,1,0,300); --Adds effects specific to this food.
	end
end;
