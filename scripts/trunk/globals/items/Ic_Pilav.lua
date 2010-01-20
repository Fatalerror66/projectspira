-----------------------------------
--	Author: Bababooey
--	Ic Pilav
--	A stir-fry dish made from rice, meat, and pine nuts.
--
--	http://wiki.ffxiclopedia.org/wiki/Ic_Pilav
--
--	3 Hours, All Races
--	Strength +4
--	Vitality -1
--	Intelligence -1
--	HP Recovered while healing +1
--	HP +15% (Cap: 65@464 Base HP)
--	Attack +22% (Cap: 65@295 Base Attack)
--	Ranged Attack +22% (Cap: 65@295 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5584,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5584,1,0,10800); --Adds effects specific to this food.
	end
end;
