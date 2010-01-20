-----------------------------------
--	Author: Bababooey
--	Sea Spray Risotto
--	The pleasant aroma of the seven seas graces this bream risotto.
--
--	http://wiki.ffxiclopedia.org/wiki/Sea_Spray_Risotto
--
--	4 Hours, All Races
--	Dexterity +6
--	Agility +3
--	Mind -4
--	HP Recovered while healing +1
--	HP +45
--	Accuracy +6% (Cap: 20)
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
		user:addStatusEffect(EFFECT_FOOD,4268,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4268,1,0,14400); --Adds effects specific to this food.
	end
end;
