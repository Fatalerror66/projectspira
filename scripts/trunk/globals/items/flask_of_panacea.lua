-----------------------------------
--	Author: Almendro
-- 	Panacea (4149)
-- 	High-level alchemic techniques have been used to brew this medicine.
--  * Removes any number of negative side effects
--  * Does not remove Curse, Doom, Petrification, Disease, Blindness, Silence, or Amnesia. 
-----------------------------------
-- Includes
require("scripts/globals/settings");
function OnUseItem(user,target,item)
	item:setAnimation(67); -- I dont know the real animation of this item from 64 to 67 should be one of those
	if (target:getStatusEffect(EFFECT_POISON) == nil and target:getStatusEffect(EFFECT_PARALYZE) == nil and
	target:getStatusEffect(EFFECT_BIND) == nil and target:getStatusEffect(EFFECT_WEIGHT) == nil and	target:getStatusEffect(EFFECT_SLOW) == nil ) then --effect already on, do nothing		
		item:setMsg(283,0); -- No effect on <player>. (message verified with retail)
		-- It does remove the item
	else
		if (target:getStatusEffect(EFFECT_POISON) ~= nil) then --effect already on, do nothing		
			target:removeStatusType(EFFECT_POISON);
			item:setMsg(64,3); -- <player> is no longer poisoned. (message verified with retail)
		end
		if (target:getStatusEffect(EFFECT_PARALYZE) ~= nil) then --effect already on, do nothing		
			target:removeStatusType(EFFECT_PARALYZE);
			item:setMsg(64,4); -- <player> is no longer paralyzed. (message verified with retail)
		end
		if (target:getStatusEffect(EFFECT_BIND) ~= nil) then --effect already on, do nothing		
			target:removeStatusType(EFFECT_BIND);
			item:setMsg(64,11); -- <player> is no longer bound. (message verified with retail)
		end
		if (target:getStatusEffect(EFFECT_WEIGHT) ~= nil) then --effect already on, do nothing		
			target:removeStatusType(EFFECT_WEIGHT);
			item:setMsg(64,12);
		end
		if (target:getStatusEffect(EFFECT_SLOW) ~= nil) then --effect already on, do nothing		
			target:removeStatusType(EFFECT_SLOW);
			item:setMsg(64,13);
		end
	end
end;