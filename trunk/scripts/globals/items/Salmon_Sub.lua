-----------------------------------
--	Author: Bababooey
--	Salmon Sub
--	A sandwich of smoked salmon on black bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Sub
--
--	30 Minutes, All Races
--	Dexterity +2
--	Agility +1
--	Vitality +1
--	Mind -2
--	Intelligence +2
--	Ranged Accuracy +2
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
		user:addStatusEffect(EFFECT_FOOD,4355,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4355,1,0,1800); --Adds effects specific to this food.
	end
end;
