-----------------------------------
--	Author: Bababooey
-- 	Prime Seafood Stewpot
-- 	The cooking of this seafood stewpot was strictly supervised to ensure
--	that the ingredients were added in the proper manner. 
--
--	http://wiki.ffxiclopedia.org/wiki/Prime_Seafood_Stewpot
--
--	4 Hours, All Races
--	Group Food Effects
--	HP +15% (Cap: ???)
--	MP +15
--	Dexterity +1
--	Agility +1
--	Mind +1
--	Defense +??% (Cap: ???)
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
		user:addStatusEffect(EFFECT_FOOD,5239,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5239,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 