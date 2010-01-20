-----------------------------------
--	Author: ReaperX, Almendro
--  Utsusemi
--	Shadow images that each absorb a single attack directed at you.
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");
-----------------------------------
function OnGainEffect(target,effect)
	sjob = player:getSubJob();
	if (effect:getPower()) == 3 and sjob == 13) then -- Utsusemi:san is only a guess
		effect:addMod(MOD_UTSUSEMI,4);
	elseif(effect:getPower()) == 3) then             -- Utsusemi:san is only a guess
		effect:addMod(MOD_UTSUSEMI,5);
	elseif (effect:getPower()) == 2 and sjob == 13) then
		effect:addMod(MOD_UTSUSEMI,3); -- Utsusemi: Ni: Gives the caster four copy images if Ninja is currently the main job; gives three shadows instead if Ninja is the support job. 
	elseif(effect:getPower()) == 2) then
		effect:addMod(MOD_UTSUSEMI,4);
	else
		effect:addMod(MOD_UTSUSEMI,3);
	end;
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;