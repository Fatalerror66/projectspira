-----------------------------------
--	Author: Bababooey
-- 	Broiled Eel
-- 	An exceptionally delicious black eel on a stick. 
--
--	http://wiki.ffxiclopedia.org/wiki/Broiled_Eel
--	
--	60 Minutes, All Races
--	Dexterity +4
--	Mind -3
--	Evasion +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_EVA,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
