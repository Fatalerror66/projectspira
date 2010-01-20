-----------------------------------
--	Author: Bababooey
-- 	Pipin' Hot Popoto
-- 	People praise the pleasant properties of pipin' hot popotoes.
--
--	http://wiki.ffxiclopedia.org/wiki/Pipin%27_Hot_Popoto
--	
--	60 Minutes, All Races
--	HP +25
--	Vitality +3
--	HP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_HPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
