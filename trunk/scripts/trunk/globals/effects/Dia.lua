-----------------------------------
--	Author: Tenjou
--  Dia (effect)
--	Entity gradually loses HP and defense is weakened.
--
--	This is not completely accurate, but it seems to work for the 3 Dia spells.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:subtractMod(MOD_DEF,target:getDef()*effect:getPower()*(26/512));	
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	target:removeHP(math.floor(((6*effect:getPower())-4)*getNaturalResist(target:getFamily())*target:getElementalResist(7)/100));
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_DEF,target:getDef()*effect:getPower()*(26/512));
end;]]--