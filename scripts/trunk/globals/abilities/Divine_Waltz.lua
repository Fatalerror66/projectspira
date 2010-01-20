-------------------------
--Divine Waltz 
--Author: Kegsay
-------------------------
require("/scripts/globals/settings");

function OnUseAbility(user, target, ability, isFirstTarget)

	--print(user)
	
	--Grabbing variables.
	local vit = target:getStat(3);
	local chr = user:getStat(7);
	local mjob = user:getMainJob(); --19 for DNC main.
	local sjob = user:getSubJob();
	local cure = 0;
	
	--Performing sj mj check.
	if (mjob == 19) then
	cure = (vit+chr)*0.25+60;
	end
	if (sjob == 19) then
	cure = (vit+chr)*0.125+60;
	end
	
	--Reducing TP.
	local tp = user:getTP();
	tp = tp - 40;
	user:setTP(tp);
	
	--Applying server mods....
	cure = cure * CURE_POWER;
	
	--Adjust message.
	if (isFirstTarget == 1) then
		ability:setMsg(306);
	else
		ability:setMsg(367);
	end
	ability:setResult(cure);
	
	user:addHP(cure);
	
	target:updateEnmity(user,cure*(240 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )),cure*(40 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )));

end;