-----------------------------------
--	Author: Bababooey
-- 	Angler Stewpot
-- 	A Far Eastern dish created with orobon meat, along with vegetables and a few
--	other ingredients. Each piece of food may be removed and eaten as soon as
--	it has finished cooking.
--
--	http://wiki.ffxiclopedia.org/wiki/Angler_Stewpot
--	3 Hours All Races
--	HP +10%
--  MP +10%
--  HP Recovered while healing +5
--  MP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPP,10);
	effect:addMod(MOD_MPP,10);
	effect:addMod(MOD_HPHEAL,5);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
