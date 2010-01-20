-----------------------------------
--	Author: Bababooey
--	San d'Orian Tea
--	A black tea popular in San d'Oria.
--
--	http://wiki.ffxiclopedia.org/wiki/San_d%27Orian_Tea
--
--	3 Hours, All Races
--	Vitality -2
--	Charisma +2
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
		user:addStatusEffect(EFFECT_FOOD,4494,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(4494,1,0,10800); --Adds effects specific to this food.
	end
end;
