-----------------------------------
--	Author: Bababooey
-- 	Humpty Dumpty Effigy
-- 	The absolute pinnacle of eggcraft artistry, this is an exceptional
--	rendition of the Humpty Dumpty of folklore. The piece's girth belies its
--	fragility.
--
--	http://wiki.ffxiclopedia.org/wiki/Humpty_Dumpty_Effigy
--	
--	3 Hours, All Races
--	Max HP +6%
--	Max MP +6%
--	HP Recovered while healing +10 (Unconfirmed)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_MPP,6);
	effect:addMod(MOD_HPHEAL,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
