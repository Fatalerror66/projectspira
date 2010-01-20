-----------------------------------
--	Author: Bababooey
--	Carbonara
--	A tasty white pasta with a creamy sauce made from Selbina milk and
--	ground black pepper.
--
--	http://wiki.ffxiclopedia.org/wiki/Carbonara
--
--	30 Minutes, All Races
--	Strength +4
--	Vitality +2
--	Intelligence -3
--	MP +10
--	HP +14% (Cap: 175@1249 Base HP)
--	Attack +18% (Cap: 65@361 Base Attack)
--	Store TP +6
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
		user:addStatusEffect(EFFECT_FOOD,5190,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(5190,1,0,1800); --Adds effects specific to this food.
	end
end;
