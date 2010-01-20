-----------------------------------
--	Author: Bababooey
-- 	Crab Sushi +1
-- 	A flawless marriage of delectable claw meat and lovingly packed vinegar rice,
--	bound together by invigoratingly fresh wasabi. 
--
--	http://wiki.ffxiclopedia.org/wiki/Crab_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Vitality +2
--	Defense +15
--	Accuracy +14%
--	Ranged Accuracy +14% (Unconfirmed)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_DEF,15);
	effect:addMod(MOD_FOOD_ACCP,14);
	effect:addMod(MOD_FOOD_RACCP,14);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
