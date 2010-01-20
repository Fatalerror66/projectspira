-----------------------------------
--	Author: Bababooey
--	Carp Sushi
--	A traditional fish dish from a land far to the east.
--
--	http://wiki.ffxiclopedia.org/wiki/Carp_Sushi
--
--	30 Minutes, All Races
--	Dexterity +1
--	HP Recovered while healing +2
--	Accuracy +10% (Cap: ???)
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
		user:addStatusEffect(EFFECT_FOOD,4407,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4407,1,0,1800); --Adds effects specific to this food.
	end
end;
