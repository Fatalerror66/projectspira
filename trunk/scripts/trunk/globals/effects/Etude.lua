-----------------------------------
--	Author: Tenjou
--  Etude
--	Enhances a single stat.  Will decay over time.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	addpower = effect:getPower();
	addstat = math.floor(addpower/1000);
	addr = addpower - addstat*1000;
	effect:addMod(addstat,addr);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	ticpower = effect:getPower();
	ticstat = math.floor(ticpower/1000);
	effect:subtractMod(ticstat,1);
	effect:setPower(effect:getPower()-1);
end;

function OnLoseEffect(target,effect)
end;
--[[

	rempower = effect:getPower();
	remstat = math.floor(rempower/1000);
	remr = rempower - remstat*1000;
	effect:subtractMod(remstat,remr);
end;]]--