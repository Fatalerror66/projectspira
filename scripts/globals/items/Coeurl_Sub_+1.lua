-----------------------------------
--	Author: Bababooey
--	Coeurl Sub +1
--	Coeurl on bread doesn't get any better than this.
--
--	http://wiki.ffxiclopedia.org/wiki/Coeurl_Sub_%2B1
--
--	60 Minutes, All Races
--	Strength +5
--	Agility +1
--	Intelligence -2
--	HP Recovered while healing +1
--	MP +15
--	Attack +22% (Cap: 80@363 Base Attack)
--	Ranged Attack +22% (Cap: 80@363 Base Ranged Attack)
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
		user:addStatusEffect(EFFECT_FOOD,5167,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5167,1,0,3600); --Adds effects specific to this food.
	end
end;
