-----------------------------------
--	Author: Bababooey
--	Coeurl Sub +1
--	Coeurl on bread doesn't get any better than this.
--
--	http://wiki.ffxiclopedia.org/wiki/Coeurl_Sub_%2B1
--
--	60 Minutes, All Races
--	Strength +5
--	Agility +1
--	Intelligence -2
--	HP Recovered while healing +1
--	MP +15
--	Attack +22% (Cap: 80@363 Base Attack)
--	Ranged Attack +22% (Cap: 80@363 Base Ranged Attack)
--	Resist Sleep
--	Resist Stun
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_FOOD_ATTP,22);
	effect:addMod(MOD_FOOD_ATT_CAP,80);
	effect:addMod(MOD_FOOD_RATTP,22);
	effect:addMod(MOD_FOOD_RATT_CAP,80);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_STUNRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

