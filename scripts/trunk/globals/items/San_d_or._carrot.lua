-----------------------------------
--	Author: Bababooey
--	San d'Orian Carrot
--	These sweet carrots are favored by chocobos.
--
--	http://wiki.ffxiclopedia.org/wiki/San_d%27Orian_Carrot
--
--	5 Minutes, All Races
--	Agility +2
--	Vitality -4
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
		user:addStatusEffect(EFFECT_FOOD,4389,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4389,1,0,300); --Adds effects specific to this food.
	end
end;
