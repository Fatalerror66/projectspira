-----------------------------------
--	Author: Almendro
-- 	Icarus Wing (4213)
-- 	Description: When used, these man-made wings instantly raise TP. Due to muscle strain, repeated use is prohibited.
--
--	Effect: Increases TP of the user by 100%
--  Note: Doesn't check job trait StoreTP because It's not implemented yet
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
if(target:getStatusEffect(EFFECT_MEDICATED) ~= nil)then
	item:setMsg(111,0); -- You cannot use potions while medicated.
	item:dontRemove();
else
	currentTP = user:getTP();
	if(currentTP + 100 >= 300)then
		finalTP = 300;
	else
		finalTP = currentTP + 100; 
	end

	--Do it!
	user:setTP(finalTP);

	--Message/Animation
	item:setAnimation(76);
	-- Wing doesn't need message
	target:addStatusEffect(EFFECT_MEDICATED,1,0,7200);
end
end; 