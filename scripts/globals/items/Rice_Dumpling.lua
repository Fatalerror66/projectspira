-----------------------------------
--	Author: Bababooey
--	Rice Dumpling
--	This steamed rice has been wrapped in a bamboo leaf. Rice dumplings are
--	said to have the power to ward off evil spirits.
--
--	http://wiki.ffxiclopedia.org/wiki/Rice_Dumpling
--
--	30 Minutes, All Races
--	Strength +3
--	Agility +1
--	Vitality +2
--	HP Recovered while healing +2
--	MP Recovered while healing +2
--	HP +17
--	Attack +20% (Cap: 45@225 Base Attack)
--	Ranged Attack +30% (Cap: 45@150 Base Ranged Attack)
--	Accuracy +5
--	Resist Paralyze
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
		user:addStatusEffect(EFFECT_FOOD,4271,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4271,1,0,1800); --Adds effects specific to this food.
	end
end;
