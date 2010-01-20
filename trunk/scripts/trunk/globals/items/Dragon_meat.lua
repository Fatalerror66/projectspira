-----------------------------------
--	Author: Bababooey
--	Dragon Meat
--	This slab of dragon meat remains fresh and juicy.
--
--	http://wiki.ffxiclopedia.org/wiki/Dragon_Meat
--
--	5 Minutes, Galka Only
--	Strength +6
--	Intelligence -8
--	Demon Killer
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
		user:addStatusEffect(EFFECT_FOOD,4572,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4572,1,0,300); --Adds effects specific to this food.
	end
end;
