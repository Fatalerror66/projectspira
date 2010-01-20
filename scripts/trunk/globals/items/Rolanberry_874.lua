-----------------------------------
--	Author: Bababooey
--	Rolanberry 874
--	This rolanberry has been preserved in the saliva of a crawler.
--	Date of preservation: 874 C.E.
--
--	http://wiki.ffxiclopedia.org/wiki/Rolanberry_874
--
--	5 Minutes, All Races
--	Agility -3
--	Intelligence +1
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
		user:addStatusEffect(EFFECT_FOOD,4530,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4530,1,0,300); --Adds effects specific to this food.
	end
end;
