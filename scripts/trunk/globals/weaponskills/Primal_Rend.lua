---------------------------
-- Primal Rend - Mythic (Light) MAGICAL WEAPON SKILL
--TP Mods: 4/4.25/4.75 for 100/200/300
--CHR:30%
--str dex vit agi int mnd chr
-- 1  2    3    4   5  6   7
--Author: Kegsay
---------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
---------------------------
function onUseWeaponSkill(attacker, target, wsID)

	local double ftp = 0;
	
	--Assigning magical WSC and base...
	local damage = (attacker:getStat(7)) * 0.3 + attacker:getMainLvl() + 2; --Lv+2+WSC
	
	--Assigning fTP multiplier...
	if (attacker:getTP() < 200) then
	ftp = (attacker:getTP())/400 + 3.75;
	end
	if (attacker:getTP() > 199) then
	ftp = (attacker:getTP()/200)+3.25;
	end
	
	--Assigning fINT addition...
	local int dInt = (attacker:getStat(5))-(target:getStat(5));
	if (dInt > 24) then
		dInt = 24;
	end
	local int fInt = 8+dInt/2;
	
	--Applying damage settings...
	damage = (damage * ftp)+fInt; 
	
	--Resistances, Day, Weather, MDIF and MDB need to be applied.
	--Make it so, Number One.
	
	--Applying server mods...
	damage = damage * WEAPON_SKILL_POWER;
	
	return damage;
end
