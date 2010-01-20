-----------------------------------
--	Author: Bababooey
-- 	Prime Beef Stewpot
-- 	The cooking of this beef stewpot was strictly supervised to ensure that
--	the ingredients were added in the proper manner.
--
--	http://wiki.ffxiclopedia.org/wiki/Prime_Beef_Stewpot
--
--	4 Hours All Races
--	Group Food Effects
--	HP +15% (Cap: 75@500 Base HP)
--  MP +15
--	Strength +2
--	Agility +1
--	Mind +1
--  Attack +20% (Cap: ???@222 Base Attack
-----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(24);
	
	effect = user:getStatusEffect(EFFECT_FOOD);
	
	if (effect ~= nil) then --Already has food
		item:dontRemove();
		item:setAnimation(55);
	else
		user:addStatusEffect(EFFECT_FOOD,5548,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5548,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 