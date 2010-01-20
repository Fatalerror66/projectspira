-----------------------------------
--	Author: Almendro
--  Silence
--  Silence is a harmful status effect that makes the target unable to cast Magic of any type until it wears off or is removed.
--  It will not prevent players from speaking in any chat channel, nor will it stop abilities that would seem to rely on sound or voice, such as Whistle or Warcry. 
-----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;