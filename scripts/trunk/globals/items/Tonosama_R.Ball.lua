-----------------------------------
--	Author: Bababooey
--	Tonosama Rice Ball
--	Only the finest ingredients are used in this rice ball.
--
--	http://wiki.ffxiclopedia.org/wiki/Tonosama_Rice_Ball
--
--	30 Minutes, All Races
--	Dexterity +3
--	Vitality +3
--	Charisma +3
--	HP +15
--	Attack +50
--	Defense +30
--	Double Attack+1% (Cap: ???)
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
		user:addStatusEffect(EFFECT_FOOD,4277,0,1800); --Adds the "has food" effect.
		user:addStatusEffect(4277,1,0,1800); --Adds effects specific to this food.
	end
end;
