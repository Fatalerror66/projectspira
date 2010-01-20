-----------------------------------
--	Author: Bababooey
--	Leremieu Taco
-- 	The former Tavnazia marquis was known to eat as many as seven of
--	these titillating Tavnazian tacos a day.
--
--	http://wiki.ffxiclopedia.org/wiki/Leremieu_Taco
--	
--	60 Minutes, All Races
--	HP +20
--	MP +20
--	Dexterity +4
--	Vitality +6
--	Charisma +4
--	Agility +4
--	HP Recovered while healing +1
--	MP Recovered while healing +1
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
		user:addStatusEffect(EFFECT_FOOD,5175,0,3600); --Adds the "has food" effect.
		user:addStatusEffect(5175,1,0,3600); --Adds effects specific to this food.
	end
end; 
 
 
 