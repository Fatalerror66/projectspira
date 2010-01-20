-----------------------------------
--	Author: Almendro
--  Curse
--	Curse is a harmful status effect that inflicts a number of bad effects
--  until it wears off or is removed. Afflicted characters have their 
--  maximum HP, MP, and Movement Speed reduced.
--	http://wiki.ffxiclopedia.org/wiki/Curse
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPP,-1*effect:getPower());
	effect:addMod(MOD_MPP,-1*effect:getPower());
	effect:addMod(MOD_MOVE,-1*effect:getPower());
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_HPP,-1*effect:getPower());
	effect:subtractMod(MOD_MPP,-1*effect:getPower());
	effect:subtractMod(MOD_MOVE,-1*effect:getPower());
end;]]--