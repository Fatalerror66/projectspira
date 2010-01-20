-----------------------------------
--	Author: Almendro
-- 	white drop
-- 	This medicine temporarily boosts charisma. 
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
	item:setAnimation(10);
	if(target:getStatusEffect(EFFECT_MEDICATED) ~= nil)then
		item:setMsg(111,0); -- You cannot use potions while medicated.
		item:dontRemove();
	else
		target:addStatusEffect(EFFECT_CHR_UP,5,0,900);
		target:addStatusEffect(EFFECT_MEDICATED,1,0,3600);
		item:setMsg(0,0);	
	end
end;