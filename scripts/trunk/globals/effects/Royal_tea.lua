-----------------------------------
--	Author: Bababooey
--	Royal Tea
--	A finely-brewed San d'Orian tea.
--
--	http://wiki.ffxiclopedia.org/wiki/Royal_Tea
--
--	4 Hours, All Races
--	Vitality -1
--	Charisma +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_CHR,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

