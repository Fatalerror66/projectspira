-----------------------------------
--	Author: Bababooey
--	Ruszor Meat
--	A roasted slab of ruszor meat, nutritious and rich in flavor.
--
--	http://wiki.ffxiclopedia.org/wiki/Ruszor_Meat
--
--	30 Minutes, Galka Only
--	Strength +5
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
		user:addStatusEffect(EFFECT_FOOD,5755,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5755,1,0,1800); --Adds effects specific to this food.
	end
end;
