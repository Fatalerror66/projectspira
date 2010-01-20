-----------------------------------
--	Author: Bababooey
--	Marinara Pizza
--	A classic pizza recipe using a zesty marinara sauce, and topped with
--	delectable chunks of fish and seafood
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara_Pizza
--
--	3 Hours, All Races
--	HP +20
--	Attack +20% (Cap: 50@250 Base Attack)
--	Accuracy +10% (Cap: 40@400 Base Accuracy)
--	Undead Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,50);
	effect:addMod(MOD_FOOD_ACCP,10);
	effect:addMod(MOD_FOOD_ACC_CAP,40);
	effect:addMod(MOD_UNDEAD_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

