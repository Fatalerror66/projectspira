-----------------------------------
--	Author: Bababooey
-- 	Prime Seafood Stewpot
-- 	The cooking of this seafood stewpot was strictly supervised to ensure
--	that the ingredients were added in the proper manner. 
--
--	http://wiki.ffxiclopedia.org/wiki/Prime_Seafood_Stewpot
--
--	4 Hours, All Races
--	Group Food Effects
--	HP +15% (Cap: ???)
--	MP +15
--	Dexterity +1
--	Agility +1
--	Mind +1
--	Defense +??% (Cap: ???)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,15);
	effect:addMod(MOD_FOOD_HP_CAP,50);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_DEX,1);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_DEFP,20);
	effect:addMod(MOD_FOOD_DEF_CAP,60);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
