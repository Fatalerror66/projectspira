-----------------------------------
--	Author: Bababooey
--	Witch Risotto
--	This mushroom risotto has been bewitched.
--
--	http://wiki.ffxiclopedia.org/wiki/Witch_Risotto
--
--	4 Hours, All Races
--	Strength -1
--	Vitality +3
--	Mind +3
--	MP Recovered while healing +2
--	MP +35
--	Enmity-1
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
		user:addStatusEffect(EFFECT_FOOD,4330,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(4330,1,0,14400); --Adds effects specific to this food.
	end
end;
