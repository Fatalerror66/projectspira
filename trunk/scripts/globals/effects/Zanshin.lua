-----------------------------------
--	Author: atkb
--  Zanshin
--	May attack again immediately after missing a target.
-----------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
  zanshin = 10;

  if (user:getEquip(6) == 14525 or user:getEquip(6) == 11281) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(7) == 15015) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(8) == 16337) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(9) == 11364 or user:getEquip(9) == 15363) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(16) == 15493) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(1) == 18438) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(1) == 18447) then
    zanshin = zanshin + 100;
  end
  if (user:getEquip(2) == 19021) then
    zanshin = zanshin + 5;
  end

  if (zanshin > 100) then 
    zanshin = 100;
  end

	effect:addMod(MOD_ZANSHIN,zanshin);
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  zanshin = 10;

  if (user:getEquip(6) == 14525 or user:getEquip(6) == 11281) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(7) == 15015) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(8) == 16337) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(9) == 11364 or user:getEquip(9) == 15363) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(16) == 15493) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(1) == 18438) then
    zanshin = zanshin + 1;
  end
  if (user:getEquip(1) == 18447) then
    zanshin = zanshin + 100;
  end
  if (user:getEquip(2) == 19021) then
    zanshin = zanshin + 5;
  end

  if (zanshin > 100) then 
    zanshin = 100;
  end

	effect:subtractMod(MOD_ZANSHIN,zanshin);
end;]]--