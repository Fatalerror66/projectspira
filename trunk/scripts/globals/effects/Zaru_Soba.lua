-----------------------------------
--	Author: Bababooey
--	Zaru Soba
--	Delicious and nutritious, this traditional dish from the Far East
--	is comprised of noodles made from buckwheat flour.
--
--	http://wiki.ffxiclopedia.org/wiki/Zaru_Soba
--
--	30 Minutes, All Races
--	Agility +3
--	HP +12% (Cap: 180@1500 Base HP)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,3);
	effect:addMod(MOD_FOOD_HPP,12);
	effect:addMod(MOD_FOOD_HP_CAP,180);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
