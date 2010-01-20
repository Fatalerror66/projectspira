-----------------------------------
--	Author: Bababooey
--	Cotton Tofu
--	A soft food made in the Far East by drying soy milk
--	atop squares of cotton cloth.
--
--	http://wiki.ffxiclopedia.org/wiki/Cotton_Tofu
--
--	5 Minutes, All Races
--	HP +10% (Cap: 30)
--	MP +10% (Cap: 30)
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
		user:addStatusEffect(EFFECT_FOOD,5233,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5233,1,0,300); --Adds effects specific to this food.
	end
end;
