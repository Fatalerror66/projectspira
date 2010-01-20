-----------------------------------
--	Author: Bababooey
-- 	Sweet Lizard
--  An incredibly simple dish made by roasting lizard tail basted with honey. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sweet_Lizard
--	
--	30 Minutes, All Races
--	HP +5
--	MP +5
--	Dexterity +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,5);
	effect:addMod(MOD_MP,5);
	effect:addMod(MOD_DEX,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
