-----------------------------------
--	Author: Bababooey
--	Yahata Sushi
--	This carp sushi's accurate degree of fermentation would make any
--	zymologist proud.
--
--	http://wiki.ffxiclopedia.org/wiki/Yahata_Sushi
--
--	60 Minutes, All Races
--	Dexterity +2
--	HP Recovered while healing +2
--	Accuracy +11% (Cap: ???)
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
		user:addStatusEffect(EFFECT_FOOD,5186,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5186,1,0,3600); --Adds effects specific to this food.
	end
end;
