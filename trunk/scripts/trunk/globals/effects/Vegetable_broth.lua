-----------------------------------
--	Author: Bababooey
-- 	Vegetable Broth
-- 	The flavor of this all vegetable soup is beyond compare.  
--
--	http://wiki.ffxiclopedia.org/wiki/Vegetable_Broth
--
--	4 Hours, All Races
--	Vitality -1
--	Agility +5
--	Ranged Accuracy +6
--	HP Recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,5);
	effect:addMod(MOD_RACC,6);
	effect:addMod(MOD_HPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
