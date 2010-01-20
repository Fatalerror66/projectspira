-----------------------------------
--	Author: Bababooey
--  Yayla Corbasi
-- 	A Near Eastern soup made from yogurt and mint. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yayla_Corbasi
--
--	3 Hours, All Races
--	HP +20
--	Dexterity -1
--	Vitality +2
--	HP Recovered while healing +2
--	MP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
