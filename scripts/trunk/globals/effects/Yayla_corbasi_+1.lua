-----------------------------------
--	Author: Bababooey
--  Yayla Corbasi +1
-- 	You have never tasted a more delicious bowl of yayla corbasi. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yayla_Corbasi_%2B1
--
--	4 Hours, All Races
--	HP +25
--	Dexterity -1
--	Vitality +3
--	HP Recovered while healing +5
--	MP Recovered while healing +2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_HPHEAL,5);
	effect:addMod(MOD_MPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
