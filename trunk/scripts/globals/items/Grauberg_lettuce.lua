-----------------------------------
--	Author: Bababooey
--	Grauberg Lettuce
--	This leafy green is known and desired for its distinctively bitter taste.
--
--	http://wiki.ffxiclopedia.org/wiki/Grauberg_Lettuce
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -3
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
		user:addStatusEffect(EFFECT_FOOD,5688,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5688,1,0,300); --Adds effects specific to this food.
	end
end;
