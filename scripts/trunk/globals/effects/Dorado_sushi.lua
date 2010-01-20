-----------------------------------
--	Author: Bababooey
-- 	Dorado Sushi
-- 	Sliced, noble lady served on a small portion of sweet vinegar rice, a
--	popular dish in the eastern empire. 
--
--	http://wiki.ffxiclopedia.org/wiki/Dorado_Sushi
--	
--	30 Minutes, All Races
--	Dexterity +5
--	Resist Sleep
--	Accuracy +15%
--	Ranged Accuracy +15% 
--	Enmity +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,5);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_ACCP,15);
	effect:addMod(MOD_RACCP,15);
	effect:addMod(MOD_ENMITY,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
