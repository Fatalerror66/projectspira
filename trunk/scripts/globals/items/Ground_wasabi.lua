-----------------------------------
--	Author: Bababooey
--	Ground Wasabi
--	Eat too much of this Eastern spice and your sinuses will be clear for months.
--
--	http://wiki.ffxiclopedia.org/wiki/Ground_Wasabi
--
--	5 Minutes, All Races
--	Strength -1
--	Dexterity -1
--	Agility -1
--	Vitality -1
--	Mind -1
--	Intelligence -1
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
		user:addStatusEffect(EFFECT_FOOD,5164,0,300); --Adds the "has food" effect.
		user:addStatusEffect(5164,1,0,300); --Adds effects specific to this food.
	end
end;
