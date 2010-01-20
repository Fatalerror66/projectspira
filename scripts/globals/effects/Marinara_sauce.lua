-----------------------------------
--	Author: Bababooey
--	Marinara Sauce
--	A zesty tomato sauce flavored with olives and anchovies.
--	Perfect for seafood dishes.
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara_Sauce
--
--	5 Minutes, All Races
--	Mind +2
--	Intelligence +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MND,2);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

