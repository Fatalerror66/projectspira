-----------------------------------
--	Author: Tenjou
-- 	Super Ether +1
-- 	This potion instantly restores a moderate amount of MP.
--
--	Actually restores 105 MP.
-----------------------------------

require("scripts/globals/settings");
function OnUseItem(user,target,item)

final = 105*ITEM_POWER;
--Cap the final amount to max MP.
if ((target:getMaxMP() - target:getMP()) < final) then
	final = (target:getMaxMP() - target:getMP());
end

--Do it!
target:addMP(final);

--Message/Animation
item:setMsg(25,final);
item:setAnimation(0x21);
end; 
 
 
 