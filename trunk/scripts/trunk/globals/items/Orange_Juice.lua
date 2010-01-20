-----------------------------------
--	Author: Tenjou
-- 	Orange Juice
-- 	Fresh-squeezed Saruta orange juice.
-----------------------------------
 
require("scripts/globals/settings");

function OnUseItem(user,target,item)
	item:setMsg(0,0);
	item:setAnimation(0);
	
	--Try to erase Refresh (default behavior).
	if (JUICE_OVERWRITE == 1) then
		target:removeStatusType(EFFECT_REFRESH);
		target:addStatusEffect(EFFECT_REFRESH,1,3,90,FLAG_DISPELABLE);
	else
		target:removeStatusType(4422);
		target:addStatusEffect(4422,1,3,90); --Don't flag this for Dispel, will cause client crash due to out-of-bounds Dispel message parameter.
	end
end; 
 
 
 