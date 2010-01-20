-----------------------------------
--	Author: Bababooey
--	Bream Risotto
--	A dish made from Bastore bream and rice.
--
--	http://wiki.ffxiclopedia.org/wiki/Bream_Risotto
--
--	3 Hours, All Races
--	Dexterity +6
--	Agility +3
--	Mind -4
--	HP Recovered while healing +1
--	HP +40
--	Accuracy +6% (Cap: 15)
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
		user:addStatusEffect(EFFECT_FOOD,5176,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5176,1,0,10800); --Adds effects specific to this food.
	end
end;
