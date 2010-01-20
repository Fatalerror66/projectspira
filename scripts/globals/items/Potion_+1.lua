-----------------------------------
--	Author: Tenjou
-- 	Potion +1
-- 	This potion instantly restores a few HP.
--
--	Actually restores 60 HP.
-----------------------------------
 
require("scripts/globals/settings");
function OnUseItem(user,target,item)

final = 60*ITEM_POWER;
--Cap the final amount to max HP.
if ((target:getMaxHP() - target:getHP()) < final) then
	final = (target:getMaxHP() - target:getHP());
end

--Do it!
target:addHP(final);

--Message/Animation
item:setMsg(24,final);
item:setAnimation(0x1e);
end; 
 
 
 