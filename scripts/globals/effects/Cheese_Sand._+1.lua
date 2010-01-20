-----------------------------------
--	Author: Bababooey
--	Cheese Sandwich +1
--	No doubt some divine power has had a hand in the forming of this flawless
--	cheese sandwich. Words do it no justice.
--
--	http://wiki.ffxiclopedia.org/wiki/Cheese_Sandwich_%2B1
--
--	60 Minutes, All Races
--	Agility +2
--	HP +10
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,2);
	effect:addMod(MOD_HP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
