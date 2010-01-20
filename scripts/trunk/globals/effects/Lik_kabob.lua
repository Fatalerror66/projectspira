-----------------------------------
--	Author: Bababooey
-- 	Lik Kabob
-- 	A lik on a stick, grilled over an open flame. 
--
--	http://wiki.ffxiclopedia.org/wiki/Lik_Kabob
--	
--	(Duration, Races) Unknown
--	Dexterity +4
--	Attack +8 (Unconfirmed)
--	Mind -3
-----------------------------------
 
require("scripts/globals/settings");
	
function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,4);
	effect:addMod(MOD_ATT,8);
	effect:subtractMod(MOD_MND,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
