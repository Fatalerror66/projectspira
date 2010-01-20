-----------------------------------
--	Author: Bababooey
--	Shogun Rice Ball
--	This tonosama rice ball has been made to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Shogun_Rice_Ball
--
--	60 Minutes, All Races
--	Dexterity +4
--	Vitality +4
--	Charisma +4
--	HP +20
--	Attack +50
--	Defense +30
--	Double Attack+5% (Cap: ???)
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
		user:addStatusEffect(EFFECT_FOOD,4278,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(4278,1,0,3600); --Adds effects specific to this food.
	end
end;
