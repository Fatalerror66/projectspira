-----------------------------------
--	Author: Bababooey
--	Coeurl Sub
--	A tasty hot sandwich made with succulent coeurl sautee and soft
--	white bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Coeurl_Sub
--
--	30 Minutes, All Races
--	Strength +5
--	Agility +1
--	Intelligence -2
--	HP Recovered while healing +1
--	MP +10
--	Attack +20% (Cap: 75@375 Base Attack)
--	Ranged Attack +20% (Cap: 75@375 Base Ranged Attack)
--	Resist Sleep
--	Resist Stun
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
		user:addStatusEffect(EFFECT_FOOD,5166,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5166,1,0,1800); --Adds effects specific to this food.
	end
end;
