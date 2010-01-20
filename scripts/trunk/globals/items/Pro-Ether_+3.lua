-----------------------------------
--	Author: Tenjou,Almendro
-- 	Pro-Ether +3
-- 	This potion instantly restores a lot of MP.
--
--	Actually restores 350 MP.
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
if(target:getStatusEffect(EFFECT_MEDICATED) ~= nil)then
	item:setMsg(111,0); -- You cannot use potions while medicated.
	item:dontRemove();
else
	final = 350*ITEM_POWER;
	--Cap the final amount to max MP.
	if ((target:getMaxMP() - target:getMP()) < final) then
		final = (target:getMaxMP() - target:getMP());
	end

	--Do it!
	target:addMP(final);

	--Message/Animation
	item:setMsg(25,final);
	item:setAnimation(0x21);
	target:addStatusEffect(EFFECT_MEDICATED,1,0,900);
end
end; 
 
 
 