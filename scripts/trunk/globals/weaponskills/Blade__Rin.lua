--[[
	Blade: Rin
	Delivers a single-hit attack. Chance of critical varies with TP.
	
	@author		Deviltti
	@see		Blade: Rin <http://wiki.ffxiclopedia.org/wiki/Blade:_Rin>
]]---------------------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
-----------------------------------------
function onUseWeaponSkill(attacker, target, wsID)
	local int fSTR=0;
	local int wsc=0;
	local double fTP=0.00;
	local double criticalHitModifier=0.00;
	local int baseDamage=0;
	local double cRatio=0.00;
	local double cRatioMIN=0.00;
	local double cRatioMAX=0.00;
	local double pDIF=0.00;
	local double hit1=0.00;
	local double criticalHit=0.00;
	local int damage=0;	
	fSTR=calculateFSTR(attacker:getStat(1),target:getStat(3),attacker:getBaseDmg());
	wsc=calculateWSC(attacker:getStat(1),0.20,attacker:getStat(2),0.20,attacker:getMainLvl());
	if(attacker:getTP()>=100 and attacker:getTP()<200) then
		fTP=1.00;
		criticalHitModifier=0.20;
	end,
	if(attacker:getTP()>=200 and attacker:getTP()<300) then
		fTP=1.00;
		criticalHitModifier=0.40;
	end,
	if(attacker:getTP() == 300) then
		fTP=1.00;
		criticalHitModifier=0.60;
	end,
	baseDamage=calculateBaseDamage(attacker:getBaseDmg(),fSTR,wsc,fTP);
	cRatio=calculateCRatio(attacker:getAtt(),target:getDef(),attacker:getMainLvl(),target:getMainLvl());
	cRatioMIN=calculateCRatioMIN(cRatio);
	cRatioMAX=calculateCRatioMAX(cRatio);
	pDIF=calculatePDIF(cRatioMIN,cRatioMAX);
	hit1=math.random();
	--print("Hit%:",hit1);
	if(hit1<=0.95) then
		criticalHit=math.random();
		--print("Critical Hit%:",criticalHit);
		if(criticalHit<=criticalHitModifier) then
			--print(target:getName(),"->Damage->Critical Hit");
			pDIF+=1;
			if(pDIF>3.00) then
				pDIF=3.00;
			end,
			damage=calculateDamage(baseDamage,pDIF);
		end,
		if(criticalHit>criticalHitModifier) then
			--print(target:getName(),"->Damage");
			damage=calculateDamage(baseDamage,pDIF);
		end,
	end,
	if(hit1>0.95) then
		--print(target:getName(),"->Miss!");
	end,
	damage=damage*WEAPON_SKILL_POWER;
---------------------------------------------
-- Katana Weapon Skill Quest
---------------------------------------------
	KodachiofTrials = 0x456D; -- Kodachi of Trials
	if(attacker:getEquip(1)==KodachiofTrials and attacker:getQuestStatus(5,147) == 1 and attacker:getVar("KatanaWeaponSkillPoints") < 300 and givesEXP(target,attacker) and damage > 0) then
			attacker:setVar("KatanaWeaponSkillPoints",attacker:getVar("KatanaWeaponSkillPoints")+1*WEAPON_SKILL_POINTS);		
	end
--------------------------------------------
	--print("Damage:",damage);
	return damage;
end;