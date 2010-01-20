-----------------------------------
--	Author: Bababooey
-- 	Goblin Mushpot
-- 	Goblin hotpots contain many kinds of mushrooms. Proper etiquette 
--	is to eat only one kind at a time.
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Mushpot
--	
--	3 Hours, All Races
--	Mind +10
--	Charisma -5
--	Resist Poison
--	Resist Blind
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MND,10);
	effect:subtractMod(MOD_CHR,5);
	effect:addMod(MOD_POISONRES,5);
	effect:addMod(MOD_BLINDRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
