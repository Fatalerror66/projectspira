---------------------------
-- Vidohunir - Dark Elemental MAGICAL WEAPON SKILL
--TP Mods: 1.75/1.75/1.75 for 100/200/300
--INT:30% MAB:30% (that's right, MAB. Magic Attack Bonus.)
--str dex vit agi int mnd chr
-- 1  2    3    4   5  6   7
--Author: Kegsay
--MAB modifier not yet implemented. There is no such function to getMAB().
---------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
---------------------------
function onUseWeaponSkill(attacker, target, wsID)

	local double ftp = 0;
	
	--Assigning magical WSC and base...
	local damage = (attacker:getStat(5)) * 0.3 + attacker:getMainLvl() + 2; --Lv+2+WSC
	
	--Assigning fTP multiplier...
	ftp = 1.75;
	
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
	damage = damage * WEAPON_SKILL_POWER;
	
	return damage;
end
