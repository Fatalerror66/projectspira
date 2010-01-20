-----------------------------------
--	Author: Bababooey
--	Naval Rice Ball
--	This salmon rice ball has been made to perfection.
--
--	http://wiki.ffxiclopedia.org/wiki/Naval_Rice_Ball
--
--	30 Minutes, All Races
--	Dexterity +3
--	Vitality +3
--	HP Recovered while healing +2
--	HP +26
--	Attack +40
--	Defense +40
--	Arcana Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3);
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_HP,26);
	effect:addMod(MOD_ATT,40);
	effect:addMod(MOD_DEF,40);
	effect:addMod(MOD_ARCANA_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

