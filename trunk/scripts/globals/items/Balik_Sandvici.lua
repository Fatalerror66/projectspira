-----------------------------------
--	Author: Bababooey
--	Balik Sandvici
--	Uskumru meat sandwiched between two slices of white bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Balik_Sandvici
--
--	30 Minutes, All Races
--	Dexterity +3
--	Agility +1
--	Mind -2
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
		user:addStatusEffect(EFFECT_FOOD,5590,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5590,1,0,1800); --Adds effects specific to this food.
	end
end;
