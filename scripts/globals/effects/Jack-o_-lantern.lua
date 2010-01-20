-----------------------------------
--	Author: Bababooey
-- 	Jack-o'-Lantern
-- 	An artfully carved ogre pumpkin. Given as a present.
--
--	http://wiki.ffxiclopedia.org/wiki/Jack-o%27-Lantern
--	
--	3 Hours, All Races
--	Charisma -10
--	Resist Dark +25
--	Accuracy +10
--	Evasion +10
--	Arcana Killer
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_CHR,10);
	effect:addMod(MOD_DARKRES,25);
	effect:addMod(MOD_ACC,10);
	effect:addMod(MOD_EVA,10);
	effect:addMod(MOD_ARCANA_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
