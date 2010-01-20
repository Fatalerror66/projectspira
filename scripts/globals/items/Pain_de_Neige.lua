-----------------------------------
--	Author: Bababooey
--	Pain de Neige
--	The fluffy center of this white bread is whiter than snow.
--
--	http://wiki.ffxiclopedia.org/wiki/Pain_de_Neige
--
--	60 Minutes, All Races
--	Vitality +4
--	HP +18
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
		user:addStatusEffect(EFFECT_FOOD,4292,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4292,1,0,3600); --Adds effects specific to this food.
	end
end;
