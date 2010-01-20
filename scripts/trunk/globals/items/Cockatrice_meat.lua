-----------------------------------
--	Author: Bababooey
--	Cockatrice Meat
--	Cockatrice meat is known for its exquisite flavor.
--
--	http://wiki.ffxiclopedia.org/wiki/Cockatrice_Meat
--
--	5 Minutes, Galka Only
--	Strength +4
--	Intelligence -6
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
		user:addStatusEffect(EFFECT_FOOD,4435,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4435,1,0,300); --Adds effects specific to this food.
	end
end;
