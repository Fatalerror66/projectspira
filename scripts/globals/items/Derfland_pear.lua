-----------------------------------
--	Author: Bababooey
--	Derfland Pear
--	A juicy pear favored by the Elvaan.
--
--	http://wiki.ffxiclopedia.org/wiki/Derfland_Pear
--
--	5 Minutes, All Races
--	Agility -3
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
		user:addStatusEffect(EFFECT_FOOD,4352,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4352,1,0,300); --Adds effects specific to this food.
	end
end;
