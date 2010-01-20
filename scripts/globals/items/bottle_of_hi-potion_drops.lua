-----------------------------------
--	Author: Tenjou
-- 	Hi-Potion Drops
-- 	These drops instantly restore a few HP.
--
--	Actually restores 110 HP.
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
function OnUseItem(user,target,item)
if(target:getStatusEffect(EFFECT_MEDICATED) ~= nil)then
	item:setMsg(111,0); -- You cannot use potions while medicated.
	item:dontRemove();
else
	final = 110*ITEM_POWER;
	--Cap the final amount to max HP.
	if ((target:getMaxHP() - target:getHP()) < final) then
		final = (target:getMaxHP() - target:getHP());
	end

	--Do it!
	target:addHP(final);

	--Message/Animation
	item:setMsg(24,final);
	item:setAnimation(0x1e);
	target:addStatusEffect(EFFECT_MEDICATED,1,0,300);
end
end; 
 
 
 