-----------------------------------
--	Author: Bababooey
--	Chamomile Tea
--	This tea is made with chamomile and honey.
--
--	http://wiki.ffxiclopedia.org/wiki/Chamomile_Tea
--
--	3 Hours, All Races
--	Vitality -2
--	Charisma +2
--	MP Recovered while healing +1
--	MP +8
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,2);
	effect:addMod(MOD_CHR,2);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_MP,8);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
