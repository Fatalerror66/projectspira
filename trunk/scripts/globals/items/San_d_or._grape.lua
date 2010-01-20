-----------------------------------
--	Author: Bababooey
--	San d'Orian Grapes
--	The Elvaan love these sweet grapes.
--
--	http://wiki.ffxiclopedia.org/wiki/San_d%27Orian_Grapes
--
--	5 Minutes, All Races
--	Agility -5
--	Intelligence +3
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
		user:addStatusEffect(EFFECT_FOOD,4431,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4431,1,0,300); --Adds effects specific to this food.
	end
end;
