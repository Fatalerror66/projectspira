-----------------------------------
--	Author: Bababooey
-- 	Leremieu Salad
-- 	Tavnazian salad with a twist!
--
--	http://wiki.ffxiclopedia.org/wiki/Leremieu_Salad
--	
--	4 Hours, All Races
--	HP +20
--	MP +20
--	Dexterity +4
--	Vitality +6
--	Agility +4
--	Charisma +4
--	Defense +25% (Cap: 160@640 Base Defense)
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
		user:addStatusEffect(EFFECT_FOOD,5185,0,14400); --Adds the "has food" effect.
		user:addStatusEffect(5185,1,0,14400); --Adds effects specific to this food.
	end
end; 
 
 
 