-----------------------------------
--	Author: Bababooey
--	Cheese Sandwich +1
--	No doubt some divine power has had a hand in the forming of this flawless
--	cheese sandwich. Words do it no justice.
--
--	http://wiki.ffxiclopedia.org/wiki/Cheese_Sandwich_%2B1
--
--	60 Minutes, All Races
--	Agility +2
--	HP +10
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
		user:addStatusEffect(EFFECT_FOOD,5687,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5687,1,0,3600); --Adds effects specific to this food.
	end
end;
