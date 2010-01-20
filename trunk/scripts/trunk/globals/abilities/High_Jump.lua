-----------------------------------
--	Author: Kegsay
-- 	High Jump
-- 	Performs a high jumping attack on enemy. 
-- Needs enmity reduction (50% or 60% depending on Wyrm Brais) implemented.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();

--Getting fSTR
local int dSTR = user:getStat(1)-target:getStat(3); 
local fSTR = getfSTR(dSTR);

--Apply fSTR caps.
	if (fSTR<((user:getBaseDmg()/9)*(-1))) then
		fSTR = (user:getBaseDmg()/9)*(-1);
	end
	if (fSTR>((user:getBaseDmg()/9)+8)) then
		fSTR = (user:getBaseDmg()/9)+8;
	end 

damage = (user:getBaseDmg()+fSTR)*(user:getStat(3)/256 +1);

--Obtaining cRatio
	local double ratio = user:getAtt()/target:getDef();
	--Level penalty...
	local double levelcor = 0;
	if (user:getMainLvl() < target:getMainLvl()) then
	levelcor = 0.05 * (target:getMainLvl() - user:getMainLvl());
	end
	ratio = ratio - levelcor;
	
	--Capping cRatio 
	if (ratio<0) then
	ratio = 0;
	end
	if (ratio>2) then
	ratio = 2;
	end
	
	--Obtaining cRatio_MIN
	local double cratiomin = 0;
	if (ratio<1.25) then
	cratiomin = 1.2 * ratio - 0.5;
	end
	if (ratio>=1.25 and ratio<=1.5) then
	cratiomin = 1;
	end
	if (ratio>1.5 and ratio<=2) then
	cratiomin = 1.2 * ratio - 0.8;
	end
	
	--Obtaining cRatio_MAX
	local double cratiomax = 0;
	if (ratio<0.5) then
	cratiomax = 0.4 + 1.2 * ratio;
	end
	if (ratio<=0.833 and ratio>=0.5) then
	cratiomax = 1;
	end
	if (ratio<=2 and ratio>0.833) then
	cratiomax = 1.2 * ratio;
	end
	
	--Applying pDIF
	local double pdif = math.random((cratiomin*1000),(cratiomax*1000)); 
	pdif = pdif/1000; --multiplier set.
	final = damage * pdif;

	--Do it!
	target:removeHP(final);
	target:updateEnmity(user,1,final);
	--target:updateEnmity(user,user:getVE()/2,user:getCE/2);
	ability:setMsg(110);
	ability:setResult(final);
end;