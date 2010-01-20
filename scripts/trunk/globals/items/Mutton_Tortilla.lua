-----------------------------------
--	Author: Bababooey
--	Mutton Tortilla
--	A tortilla stuffed with giant sheep meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Mutton_Tortilla
--
--	30 Minutes, All Races
--	Strength +3
--	Vitality +1
--	Intelligence -1
--	MP +10
--	Attack +27% (Cap: 30@111 Base Attack)
--	Ranged Attack +27% (Cap: 30@111 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,4506,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4506,1,0,1800); --Adds effects specific to this food.
	end
end;
