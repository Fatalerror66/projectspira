-----------------------------------
--	Author: Bababooey
-- 	Kohlrouladen +1
-- 	This delectable dish of seasoned ground beef rolled in pickled cabbage
--	leaves was a popular wartime ration among Republican soldiers. 
--
--	http://wiki.ffxiclopedia.org/wiki/Kohlrouladen
--
--	60 Minutes, All Races
--	Strength +3
--	Agility +3
--	Intelligence -5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,3);
	effect:addMod(MOD_AGI,3);
	effect:subtractMod(MOD_INT,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
