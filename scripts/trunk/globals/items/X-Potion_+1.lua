-----------------------------------
--	Author: Tenjou
-- 	X-Potion +1
-- 	This potion instantly restores a moderate amount of HP.
--
--	Actually restores 160 HP.
-----------------------------------
 
require("scripts/globals/settings");
function OnUseItem(user,target,item)

final = 160*ITEM_POWER;
--Cap the final amount to max HP.
if ((target:getMaxHP() - target:getHP()) < final) then
	final = (target:getMaxHP() - target:getHP());
end

--Do it!
target:addHP(final);

--Message/Animation
item:setMsg(24,final);
item:setAnimation(0x1f);
end; 
 
 
 