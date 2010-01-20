-----------------------------------
--	Author: Bababooey
--	Red Hot Cracker
--	Before eating one of these spicy crackers, be sure to find a bottle
--	of distilled water to put out the fire in your mouth.
--
--	http://wiki.ffxiclopedia.org/wiki/Red_Hot_Cracker
--
--	3 Minutes, All Races
--	HP Recovered while healing +9
--	Resist Sleep
--	Beast Killer
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
		user:addStatusEffect(EFFECT_FOOD,4281,0,180); --Adds the "has food" effect.
		user:addStatusEffect(4281,1,0,180); --Adds effects specific to this food.
	end
end;
