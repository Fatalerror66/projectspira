-----------------------------------
--	Author: Bababooey
-- 	Flint Caviar
-- 	The salted roe of the emperor fish are also known as "Black Diamonds."
--
--	http://wiki.ffxiclopedia.org/wiki/Flint_Caviar
--	
--	30 Minutes, All Races
--	HP +10
--	MP +10
--	Dexterity +4
--	Mind -1
--	Charisma +4
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_CHR,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
