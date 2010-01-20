-----------------------------------
--	Author: Bababooey
-- 	Anchovy
-- 	Icefish or sandfish pickled in oil. Mass produced and rationed to the
--	Republican Army during the Crystal War. 
--
--	http://wiki.ffxiclopedia.org/wiki/Anchovy
--	
--	Wiki lists this as a 3-minute food. 
--
--	3 Minutes, All Races
--	Dexterity +1
--	Mind -3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:subtractMod(MOD_MND,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;