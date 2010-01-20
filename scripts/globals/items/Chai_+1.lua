-----------------------------------
--	Author: Bababooey
--	Chai +1
--	A rich aroma wafts from this cup of chai.
--
--	http://wiki.ffxiclopedia.org/wiki/Chai_%2B1
--
--	4 Hours, All Races
--	Vitality -3
--	Charisma +3
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
		user:addStatusEffect(EFFECT_FOOD,5594,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5594,1,0,14400); --Adds effects specific to this food.
	end
end;
