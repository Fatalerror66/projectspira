-----------------------------------
--	Author: Bababooey
--	Rice Ball
--	This snack is made by shaping steamed Tarutaru rice into a ball.
--
--	http://wiki.ffxiclopedia.org/wiki/Rice_Ball
--
--	30 Minutes, All Races
--	Dexterity -1
--	Vitality +2
--	HP Recovered while healing +1
--	HP +10
--	Defense +50
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_DEX,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_DEF,50);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
