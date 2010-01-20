-----------------------------------
--	Author: Bababooey
--	Anchovy Pizza
--	An often slighted pizza varietal that
--	makes up for its lack of adherents
--	with lots of salt.
--
--	http://wiki.ffxiclopedia.org/wiki/Anchovy_Pizza
--
--	3 Hours, All Races
--	Dexterity +1
--	Attack +20% (Cap: ???)
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
		user:addStatusEffect(EFFECT_FOOD,5699,0,10800); --Adds the "has food" effect.
		user:addStatusEffect(5699,1,0,10800); --Adds effects specific to this food.
	end
end;
