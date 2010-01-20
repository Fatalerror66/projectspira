-----------------------------------
--	Author: Bababooey
--	Mutton Enchilada
--	This spicy dish is one step above your normal mutton tortilla.
--
--	http://wiki.ffxiclopedia.org/wiki/Mutton_Enchilada
--
--	60 Minutes, All Races
--	Strength +3
--	Vitality +1
--	Intelligence -1
--	MP +10
--	Attack +27% (Cap: 35@129 Base Attack)
--	Ranged Attack +27% (Cap: 35@129 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4348,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4348,1,0,3600); --Adds effects specific to this food.
	end
end;
