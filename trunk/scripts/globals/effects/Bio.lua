-----------------------------------
--	Author: Tenjou
--  Bio (effect)
--	Entity gradually loses HP and attack is weakened.
--
--	This is not completely accurate, but it seems to work for the 3 Bio spells.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:subtractMod(MOD_ATT,target:getDef()*effect:getPower()*(26/512));	
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	target:removeHP(math.floor(((6*effect:getPower())-4)*getNaturalResist(target:getFamily())*target:getElementalResist(8)/100));
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_ATT,target:getDef()*effect:getPower()*(26/512));
end;]]--