-----------------------------------
--	Author: Bababooey
-- 	Eel Kabob
-- 	A black eel roasted on a stick. Can also be made with a yilanbaligi. 
--
--	http://wiki.ffxiclopedia.org/wiki/Eel_Kabob
--	
--	30 Minutes, All Races
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
