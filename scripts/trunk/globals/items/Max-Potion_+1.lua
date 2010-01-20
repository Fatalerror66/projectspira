-----------------------------------
--	Author: Tenjou
-- 	Max-Potion +1
-- 	This potion instantly restores a lot of HP.
--
--	Unknown amount of HP... using linear extrapolation for now.
-----------------------------------
 
require("scripts/globals/settings");
function OnUseItem(user,target,item)

final = 550*ITEM_POWER;
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
 
 
 