-----------------------------------
--	Author: Tenjou
--  Healing
--
--	Activated through the /heal command
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	--Log starting time
	target:setVar("healingStartTime",os.clock());
end;

function OnTick(target,effect)
	--Count tics
	healtime = math.floor((os.clock()-target:getVar("healingStartTime"))/10);
	--Healing begins on the second tic.  Will add effects such as gear and clear mind later.
	if (healtime > 1) then
	
		if (target:getStatusEffect(EFFECT_SIGNET) ~= nil) then --Target has Signet; recover additional HP and do not lose TP.
			target:addHP(10+(3*math.floor(target:getMainLvl()/10))+(healtime-2+(1+math.floor(target:getMaxHP()/300)))+(effect:getMod(MOD_HPHEAL)));
		else
			target:addHP(10+(healtime-2)+(effect:getMod(MOD_HPHEAL)));
			target:setTP(target:getTP() - 10);
		end
		
		target:addMP(12+(healtime-2)+(effect:getMod(MOD_MPHEAL))+(effect:getMod(MOD_CLEARMIND)*(healtime-2)));
	end
end;

function OnLoseEffect(target,effect)
end;
--[[

	--Erase starting time
	target:setVar("healingStartTime",0);
end;]]--