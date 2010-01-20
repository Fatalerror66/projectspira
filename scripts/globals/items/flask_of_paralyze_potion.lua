-----------------------------------
--	Author: Almendro
-- 	Paralyze potion (4159)
-- 	This potion induces paralysis.
-----------------------------------
-- Includes
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	item:setAnimation(69);
	if (target:getStatusEffect(EFFECT_PARALYZE) ~= nil) then --effect already on, do nothing		
		item:setMsg(283,0); -- No effect on <player>. (message verified with retail)
		-- It does remove the item
	else
		target:addStatusEffect(EFFECT_PARALYZE,25,0,120); --- duration 120sec and 25% of activation is only a guess and more data is needed
		item:setMsg(0,0);
	end
end;