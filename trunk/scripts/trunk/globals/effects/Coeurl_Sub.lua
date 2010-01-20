-----------------------------------
--	Author: Bababooey
--	Coeurl Sub
--	A tasty hot sandwich made with succulent coeurl sautee and soft
--	white bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Coeurl_Sub
--
--	30 Minutes, All Races
--	Strength +5
--	Agility +1
--	Intelligence -2
--	HP Recovered while healing +1
--	MP +10
--	Attack +20% (Cap: 75@375 Base Attack)
--	Ranged Attack +20% (Cap: 75@375 Base Ranged Attack)
--	Resist Sleep
--	Resist Stun
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,75);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,75);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_STUNRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

