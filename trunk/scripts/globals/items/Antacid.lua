-----------------------------------
--	Author: Tenjou,Almendro
-- 	Antacid
-- 	This medicine helps remove meal effects.
--
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
	item:setAnimation(55); --Not the actual animation.
	
	food = target:getStatusEffect(EFFECT_FOOD);
	
	if (food ~= nil) then
		fooditem = food:getPower();
		target:removeStatusType(fooditem);
		target:removeStatusType(EFFECT_FOOD);
	else
		item:setMsg(283,0); -- No effect on <player>. 
	end
end; 
 
 
 