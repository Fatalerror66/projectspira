-----------------------------------
--	Author: Bababooey
--	Yahata Sushi
--	This carp sushi's accurate degree of fermentation would make any
--	zymologist proud.
--
--	http://wiki.ffxiclopedia.org/wiki/Yahata_Sushi
--
--	60 Minutes, All Races
--	Dexterity +2
--	HP Recovered while healing +2
--	Accuracy +11% (Cap: ???)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_FOOD_ACCP,11);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

