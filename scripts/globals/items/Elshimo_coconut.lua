-----------------------------------
--	Author: Bababooey
--	Elshimo Coconut
--	A hard shell protects the juicy meat found inside this tropical delicacy.
--
--	http://wiki.ffxiclopedia.org/wiki/Elshimo_Coconut
--
--	5 Minutes, All Races
--	Agility -1
--	Intelligence +1
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
		user:addStatusEffect(EFFECT_FOOD,5187,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5187,1,0,300); --Adds effects specific to this food.
	end
end;
