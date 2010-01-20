-----------------------------------
--	Author: Almendro
-- 	Poison potion (4157)
-- 	This potion induces poisoning. 
-----------------------------------
-- Includes
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	item:setAnimation(68);
	if (target:getStatusEffect(EFFECT_POISON) ~= nil) then --effect already on, do nothing		
		item:setMsg(283,0); -- No effect on <player>. (message verified with retail)
		-- It does remove the item
	else
		target:addStatusEffect(EFFECT_POISON,1,3,180);
		item:setMsg(0,0);
	end
end;