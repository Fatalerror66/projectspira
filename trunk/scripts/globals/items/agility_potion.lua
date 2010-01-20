-----------------------------------
--	Author: Almendro
-- 	agility potion (4205)
-- 	This medicine temporarily boosts agility. 
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
	item:setAnimation(24);
	if(target:getStatusEffect(EFFECT_MEDICATED) ~= nil)then
		item:setMsg(111,0); -- You cannot use potions while medicated.
		item:dontRemove();
	else
		target:addStatusEffect(EFFECT_AGI_UP,7,0,180);
		target:addStatusEffect(EFFECT_MEDICATED,1,0,900);
		item:setMsg(0,0);	
	end
end;