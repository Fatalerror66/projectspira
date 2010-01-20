-----------------------------------
--	Author: Bababooey
-- 	Baked Popoto
-- 	A popoto baked in its skin.
--
--	http://wiki.ffxiclopedia.org/wiki/Baked_Popoto
--	
--	30 Minutes, All Races
--	HP +20
--	Dexterity -1
--	Vitality +2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
