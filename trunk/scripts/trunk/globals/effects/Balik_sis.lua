-----------------------------------
--	Author: Bababooey
-- 	Balik Sis
-- 	Fish meat and tomatoes on a skewer. Popular in the Near East. 
--
--	http://wiki.ffxiclopedia.org/wiki/Balik_Sis
--	
--
--	30 Minutes, All Races
--	Dexterity +4
--	Mind -2
--	Attack +13% (Cap: 65)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_FOOD_ATTP,13);
	effect:addMod(MOD_FOOD_ATT_CAP,65);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
