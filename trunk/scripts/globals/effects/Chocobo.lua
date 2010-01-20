-----------------------------------
--	Author: Tenjou
--	Chocobo (effect)
--	Entity is riding a chocobo for the allotted time.
--
--	They see me rollin'
--	They hatin'
--	Patrollin'
--	And tryin' to catch me ridin' birdy
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	target:setAnimation(0x5);
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

	target:setAnimation(0x0);
end;]]--