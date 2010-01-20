-----------------------------------
--	Author: Bababooey
--	Salsa
--	A zesty sauce used by chefs specializing in dishes originating
--	in the Far West.
--
--	http://wiki.ffxiclopedia.org/wiki/Salsa
--
--	3 Minutes, All Races
--	Strength -1
--	Dexterity -1
--	Agility -1
--	Vitality -1
--	Mind -1
--	Intelligence -1
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
		user:addStatusEffect(EFFECT_FOOD,5299,0,180); --Adds the "has food" effect.
		user:addStatusEffect(5299,1,0,180); --Adds effects specific to this food.
	end
end;
