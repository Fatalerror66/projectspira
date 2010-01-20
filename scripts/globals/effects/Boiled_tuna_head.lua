-----------------------------------
--	Author: Bababooey
-- 	Boiled Tuna Head
-- 	A boiled Gugru tuna head. 
--
--	http://wiki.ffxiclopedia.org/wiki/Boiled_Tuna_Head
--	
--	3 Hours, All Races
--	MP +20
--	Dexterity +3
--	Intelligence +4
--	Mind -3
--	MP Recovered while healing +2
--	Accuracy +5
--	Evasion +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,20);
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_INT,4);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_ACC,5);
	effect:addMod(MOD_EVA,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
