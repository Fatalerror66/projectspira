-----------------------------------
--	Author: Bababooey
--	King Truffle
--	These rare fungi are known for their unique scent. Packed with nutrients,
--	eating these is said to speed healing.
--
--	http://wiki.ffxiclopedia.org/wiki/King_Truffle
--
--	5 Minutes, All Races
--	Strength -6
--	Mind +4
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
		user:addStatusEffect(EFFECT_FOOD,4386,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4386,1,0,300); --Adds effects specific to this food.
	end
end;
