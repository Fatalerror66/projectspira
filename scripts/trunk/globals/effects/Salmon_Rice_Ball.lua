-----------------------------------
--	Author: Bababooey
--	Salmon Rice Ball
--	This rice ball has salmon packed inside.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Rice_Ball
--
--	30 Minutes, All Races
--	Dexterity +2
--	Vitality +2
--	Mind -1
--	HP Recovered while healing +1
--	HP +25
--	Attack +40
--	Defense +40
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_ATT,40);
	effect:addMod(MOD_DEF,40);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

