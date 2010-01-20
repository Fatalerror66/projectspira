-----------------------------------
--	Author: Almendro
-- 	Petrify potion (4160)
-- 	This potion induces petrification.
-----------------------------------
-- Includes
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	item:setAnimation(73);
	if (target:getStatusEffect(EFFECT_PETRIFY) ~= nil) then --effect already on, do nothing		
		item:setMsg(283,0); -- No effect on <player>. (message verified with retail)
		-- It does remove the item
	else
		target:addStatusEffect(EFFECT_PETRIFY,1,0,30); --- duration 30sec is only a guess and more data is needed
		item:setMsg(0,0);
	end
end;