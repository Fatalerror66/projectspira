-----------------------------------
--	Author: Bababooey
--	Moon Carrot
--	These rare carrots are believed to come from the moon.
--
--	http://wiki.ffxiclopedia.org/wiki/Moon_Carrot
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -1
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
		user:addStatusEffect(EFFECT_FOOD,4567,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4567,1,0,300); --Adds effects specific to this food.
	end
end;
