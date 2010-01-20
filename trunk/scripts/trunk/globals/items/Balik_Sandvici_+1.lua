-----------------------------------
--	Author: Bababooey
--	Balik Sandvici +1
--	The most delicious balik sandvici you've ever tasted.
--
--	http://wiki.ffxiclopedia.org/wiki/Balik_Sandvici_%2B1
--
--	60 Minutes, All Races
--	Dexterity +3
--	Agility +1
--	Mind -2
--	Intelligence +3
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
		user:addStatusEffect(EFFECT_FOOD,5591,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5591,1,0,3600); --Adds effects specific to this food.
	end
end;
