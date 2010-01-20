-----------------------------------
--	Author: Bababooey
--	Marinara
--	Bountiful portions of seafood flavor in a pomodoro sauce sautee. A favorite
--	among seafarers.
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara
--
--	30 Minutes, All Races
--	Vitality +2
--	HP +15% (Cap: 120@800 Base HP)
--	Defense +5
--	Store TP +7
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_HPP,15);
	effect:addMod(MOD_FOOD_HP_CAP,120);
	effect:addMod(MOD_DEF,5);
	effect:addMod(MOD_STORETP,7);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

