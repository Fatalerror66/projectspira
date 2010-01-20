-----------------------------------
--	Author: Bababooey
-- 	Bream Sushi
-- 	Sliced, raw bream served on a smallportion of sweet vinegar rice, a
--	popular dish in the eastern empire. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bream_Sushi
--	
--	30 Minutes, All Races
--	Dexterity +6
--	Vitality +5
--	Resist Sleep
--	Accuracy +16%
--	Ranged Accuracy +16%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,6);
	effect:addMod(MOD_VIT,5);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_ACCP,16);
	effect:addMod(MOD_RACCP,16);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
