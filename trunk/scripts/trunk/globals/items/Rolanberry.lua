-----------------------------------
--	Author: Bababooey
--	Rolanberry
--	This tart berry is very popular in Quon.
--
--	http://wiki.ffxiclopedia.org/wiki/Rolanberry
--
--	5 Minutes, All Races
--	Agility -4
--	Intelligence +2
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
		user:addStatusEffect(EFFECT_FOOD,4365,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4365,1,0,300); --Adds effects specific to this food.
	end
end;
