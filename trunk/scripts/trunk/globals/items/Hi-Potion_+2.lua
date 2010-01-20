-----------------------------------
--	Author: Tenjou
-- 	Hi-Potion +2
-- 	This potion instantly restores some HP.
--
--	Actually restores 120 HP.
-----------------------------------

require("scripts/globals/settings");
function OnUseItem(user,target,item)

final = 120*ITEM_POWER;
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
 
 
 