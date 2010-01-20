-----------------------------------
--	Author: Bababooey
--	Hare Meat
--	This meat is from a small wild rabbit.
--
--	http://wiki.ffxiclopedia.org/wiki/Hare_Meat
--
--	5 Minutes, Galka Only
--	Strength +1
--	Intelligence -3
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
		user:addStatusEffect(EFFECT_FOOD,4358,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4358,1,0,300); --Adds effects specific to this food.
	end
end;
