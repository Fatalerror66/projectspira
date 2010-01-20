-----------------------------------
--	Author: Bababooey
-- 	Witch Kabob
-- 	These roast mushrooms have been bewitched.
--
--	http://wiki.ffxiclopedia.org/wiki/Witch_Kabob
--	
--	60 Minutes, All Races
--	MP +15
--	Mind +4
--	MP Recovered while healing +3
--	Enmity -1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_MND,4);
	effect:addMod(MOD_MPHEAL,3);
	effect:subtractMod(MOD_ENMITY,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
