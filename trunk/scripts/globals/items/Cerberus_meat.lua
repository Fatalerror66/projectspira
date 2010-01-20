-----------------------------------
--	Author: Bababooey
--	Cerberus Meat
--	This Cerberus meat gives off heat even though it has never been cooked.
--
--	http://wiki.ffxiclopedia.org/wiki/Cerberus_Meat
--
--	30 Minutes, Galka Only
--	Strength +6
--	Intelligence -6
--	HP +10
--	MP -10
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
		user:addStatusEffect(EFFECT_FOOD,5565,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5565,1,0,1800); --Adds effects specific to this food.
	end
end;
