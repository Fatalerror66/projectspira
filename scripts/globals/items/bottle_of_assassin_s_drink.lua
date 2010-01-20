-----------------------------------
--	Author: Almendro
-- 	bottle of assassin's drink
-- 	This medicine temporarily increases magic accuracy. 
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
	item:setAnimation(76);
	if(target:getStatusEffect(EFFECT_MAGIC_ATT_UP) == nil)then
		target:addStatusEffect(EFFECT_MAGIC_ATT_UP,50,0,60);
	else
		
	end
end;