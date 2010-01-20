-----------------------------------
--	Author: Bababooey
--	Land Crab Meat
--	Land crab meat is known for its tenderness.
--
--	http://wiki.ffxiclopedia.org/wiki/Land_Crab_Meat
--
--	5 Minutes, Mithra Only
--	Dexterity -4
--	Vitality +3
--	Defense +15% (Cap: ???)
-----------------------------------------

require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);

	effect = user:getStatusEffect(EFFECT_FOOD);
	notmithran = (player.getRace() ~= 7);
	
	if (effect ~= nil) or notmithran then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,4400,0,300); --Adds the "has food" effect.
		user:addStatusEffect(4400,1,0,300); --Adds effects specific to this food.
	end
end;
