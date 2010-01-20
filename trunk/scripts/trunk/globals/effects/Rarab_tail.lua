-----------------------------------
--	Author: Bababooey
--	Rarab Tail
--	Dark energy was used to germinate this strain of blue pea.
--
--	http://wiki.ffxiclopedia.org/wiki/Rarab_Tail
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_VIT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
