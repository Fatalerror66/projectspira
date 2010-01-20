-----------------------------------
--	Author: Bababooey
--	Healing Tea
--	This savory blend of chamomile tea is
--	rumored to have soothing properties.
--
--	http://wiki.ffxiclopedia.org/wiki/Healing_Tea
--
--	4 Hours, All Races
--	Vitality -1
--	Charisma +3
--	MP Recovered while healing +2
--	MP +10
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_CHR,3);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_MP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

