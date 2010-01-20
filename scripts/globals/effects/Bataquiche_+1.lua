-----------------------------------
--	Author: Bababooey
-- 	Bataquiche +1
-- 	The flaky crust of this heavenly quiche will make a grown Galka cry.
--
--	http://wiki.ffxiclopedia.org/wiki/Bataquiche_%2B1
--	
--	60 Minutes, All Races
--	MP +10
--	Vitality -1
--	Agility +1
--	Ranged Accuracy +7% (Cap: 20@286)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,10);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
