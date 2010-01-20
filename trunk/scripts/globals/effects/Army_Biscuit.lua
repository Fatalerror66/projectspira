-----------------------------------
--	Author: Bababooey
--	Army Biscuit
--	A hard, tasteless biscuit high in calories. Rationed to Federation Army
--	soldiers during the Crystal War.
--
--	http://wiki.ffxiclopedia.org/wiki/Army_Biscuit
--
--	 Minutes, All Races
--	HP Recovered while healing +3
--	MP Recovered while healing +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,3);
	effect:addMod(MOD_MPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
