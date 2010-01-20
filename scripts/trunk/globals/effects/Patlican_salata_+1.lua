-----------------------------------
--	Author: Bababooey
-- 	Patlican Salata +1
-- 	Eggplants mixed with yogurt couldn't possibly taste any better than this.
--
--	http://wiki.ffxiclopedia.org/wiki/Patlican_Salata_%2B1
--	
--	4 Hours, All Races
--	Vitality -1
--	Agility +4
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
