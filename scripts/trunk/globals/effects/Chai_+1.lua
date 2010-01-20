-----------------------------------
--	Author: Bababooey
--	Chai +1
--	A rich aroma wafts from this cup of chai.
--
--	http://wiki.ffxiclopedia.org/wiki/Chai_%2B1
--
--	4 Hours, All Races
--	Vitality -3
--	Charisma +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,3);
	effect:addMod(MOD_CHR,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
