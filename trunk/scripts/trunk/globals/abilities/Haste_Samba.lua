-------------------------
--Haste Samba
--Author: TheRedLightning
--http://wiki.ffxiclopedia.org/wiki/Haste_Samba)
-------------------------

require("/scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
require("/scripts/globals/status");

-- Defines
duration = 90;
    power = 5; -- 5% haste
--------------------------------------

function OnUseAbility(user, target, ability, isFirstTarget)
  --Grabbing variables.
  local mjob = user:getMainJob(); --45 for DNC main.
  
  --Reducing TP.
  local tp = user:getTP();
  tp = tp - 35;
  user:setTP(tp);

  --Do it
  haste = user:getStatusEffect(EFFECT_HASTE);
  if(haste ~= nil)then
			user:removeStatusType(EFFECT_HASTE);
   user:addStatusEffect(EFFECT_HASTE,power,0,duration,FLAG_DISPELABLE);
		else
  user:addStatusEffect(EFFECT_HASTE,power,0,duration,FLAG_DISPELABLE);
		end	
	target:updateEnmity(user,300,1);
--Message
end;