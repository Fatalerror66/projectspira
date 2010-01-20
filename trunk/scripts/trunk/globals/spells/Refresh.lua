--------------------------------------
--	Author: Tenjou
-- 	Refresh
-- 	Gradually restores target's MP.
--
--	http://wiki.ffxiclopedia.org/wiki/Refresh
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate amount to heal per tic.
	mp = 3;
	
	--Calculate duration
	duration = 150;
	
	--Scale down duration based on level.
	if (target:getMainLvl() < 41) then
		duration = duration * target:getMainLvl() / 41;
	end
	
	--Try to erase same level refresh.
	refresh = target:getStatusEffect(EFFECT_REFRESH);
	if (refresh ~= nil and refresh:getPower() <= mp) then
		target:removeStatusType(EFFECT_REFRESH);
	end
	
	--Check for a higher level refresh.
	if (refresh ~= nil and refresh:getPower() > mp) then
		spell:setMsg(75);
	else
		--Do it!
		target:addStatusEffect(EFFECT_REFRESH,mp,3,duration,FLAG_DISPELABLE);
		--Adjust message for multiple targets.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(230);
		else
			spell:setMsg(266);
		end
	end
	
	target:updateEnmity(caster,300,1);
	final = EFFECT_REFRESH;
	return final;
end;