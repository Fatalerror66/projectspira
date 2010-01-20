-----------------------------------
--	Author: Almendro
--  Weakness effect
--	Weakness is a harmful status effect that reduces the character's overall
--  power until it wears off or is removed. Afflicted characters have their 
--  maximum HP and MP pools reduced significantly (to about 25% of normal value),
--  and will suffer from a 100% Slow effect (adjusted by Haste from equipment,
--  job abilities, traits and by the spell). 
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	--print("****************** Hello weakness entering");
	effect:subtractMod(MOD_HPP,75);
	effect:subtractMod(MOD_MPP,75);
	effect:subtractMod(MOD_HASTE,100);
	target:addHP(0);
	target:addMP(0);
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_HPP,75);
	effect:addMod(MOD_MPP,75);
	effect:addMod(MOD_HASTE,100);
	target:addHP(0);
	target:addMP(0);
end;]]--