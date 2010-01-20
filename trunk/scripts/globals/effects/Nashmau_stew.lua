-----------------------------------
--	Author: Bababooey
--  Nashmau Stew
-- 	Seafood stew made by a Qiqirn.
--
--	http://wiki.ffxiclopedia.org/wiki/Nashmau_Stew
--
--	3 Hours, All Races
--	Group Food Effects
--	MP -100
--	Vitality -10
--	Agility -10
--	Intelligence -10
--	Mind -10
--	Charisma -10
--	Accuracy +15% (Cap: 25@166 Base Accuracy)
--	Attack +18% (Cap: 60@333 Base Attack)
--	Defense -100
--	Evasion -100
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_MP,100);
	effect:subtractMod(MOD_VIT,10);
	effect:subtractMod(MOD_AGI,10);
	effect:subtractMod(MOD_INT,10);
	effect:subtractMod(MOD_MND,10);
	effect:subtractMod(MOD_CHR,10);
	effect:addMod(MOD_FOOD_ACCP,15);
	effect:addMod(MOD_FOOD_ACC_CAP,25);
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,60);
	effect:subtractMod(MOD_DEF,100);
	effect:subtractMod(MOD_EVA,100);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
