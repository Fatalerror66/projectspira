-----------------------------------
--	Author: Bababooey
-- 	Humpty Dumpty Effigy
-- 	The absolute pinnacle of eggcraft artistry, this is an exceptional
--	rendition of the Humpty Dumpty of folklore. The piece's girth belies its
--	fragility.
--
--	http://wiki.ffxiclopedia.org/wiki/Humpty_Dumpty_Effigy
--	
--	3 Hours, All Races
--	Max HP +6%
--	Max MP +6%
--	HP Recovered while healing +10 (Unconfirmed)
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
		user:addStatusEffect(EFFECT_FOOD,5683,10800); --Adds the "has food" effect.
		user:addStatusEffect(5683,1,0,10800); --Adds effects specific to this food.
	end;
end; 
 
 
 