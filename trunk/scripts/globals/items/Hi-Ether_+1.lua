-----------------------------------
--	Author: Tenjou
-- 	Hi-Ether
-- 	This potion instantly restores some MP.
--
--	Actually restores 55 MP.
-----------------------------------

require("scripts/globals/settings");
function OnUseItem(user,target,item)

final = 55*ITEM_POWER;
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
 
 
 