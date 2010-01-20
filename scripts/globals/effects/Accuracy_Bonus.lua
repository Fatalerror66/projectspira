-----------------------------------
--	Author: atkb
--  Accuracy Bonus
--	Increases the accuracy of physical attacks.
-----------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
  mjob = target:getMainJob();
  mlvl = target:getMainLvl();
  sjob = target:getSubJob();
  slvl = target:getSubLvl();
  acc = 10;
  sacc = 10;
  accbonus1 = 10; -- RNG10 / DRG30 / DNC30 (BLU63)(PUP Automaton)
  accbonus2 = 22; -- RNG30 / DRG50 / DNC60
  accbonus3 = 35; -- RNG50
  accbonus4 = 48; -- RNG70

  -- Check MainJob
  if (mjob == 11) then -- Ranger
    if (mlvl >= 70) then
      acc = accbonus4;
    elseif (mlvl >= 50) then
      acc = accbonus3;
    elseif (mlvl >= 30) then
      acc = accbonus2;
    elseif (mlvl >= 10) then
      acc = accbonus1;
    end
  elseif (mjob == 14) then -- Dragoon
    if (mlvl >= 50) then
      acc = accbonus2;
    elseif (mlvl >= 30) then
      acc = accbonus1;
    end
  elseif (mjob == 19) then -- Dancer
    if (mlvl >= 60) then
      acc = accbonus2;
    elseif (mlvl >= 30) then
      acc = accbonus1;
    end
  end

  -- Check SubJob
  if (sjob == 11) then -- Ranger
    if (slvl >= 30) then
      sacc = accbonus2;
    elseif (slvl >= 10) then
      sacc = accbonus1;
    end
  elseif (sjob == 14) then -- Dragoon
    if (slvl >= 30) then
      sacc = accbonus1;
    end
  elseif (sjob == 19) then -- Dancer
    if (slvl >= 30) then
      sacc = accbonus1;
    end
  end

  -- Add only the highest
  if (sacc > acc) then
    acc = sacc;
  end

	effect:addMod(MOD_ACC,acc);
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  mjob = target:getMainJob();
  mlvl = target:getMainLvl();
  sjob = target:getSubJob();
  slvl = target:getSubLvl();
  acc = 10;
  sacc = 10;
  accbonus1 = 10; -- RNG10 / DRG30 / DNC30
  accbonus2 = 22; -- RNG30 / DRG50 / DNC60
  accbonus3 = 35; -- RNG50
  accbonus4 = 48; -- RNG70

  -- Check MainJob
  if (mjob == 11) then -- Ranger
    if (mlvl >= 70) then
      acc = accbonus4;
    elseif (mlvl >= 50) then
      acc = accbonus3;
    elseif (mlvl >= 30) then
      acc = accbonus2;
    elseif (mlvl >= 10) then
      acc = accbonus1;
    end
  elseif (mjob == 14) then -- Dragoon
    if (mlvl >= 50) then
      acc = accbonus2;
    elseif (mlvl >= 30) then
      acc = accbonus1;
    end
  elseif (mjob == 19) then -- Dancer
    if (mlvl >= 60) then
      acc = accbonus2;
    elseif (mlvl >= 30) then
      acc = accbonus1;
    end
  end

  -- Check SubJob
  if (sjob == 11) then -- Ranger
    if (slvl >= 30) then
      sacc = accbonus2;
    elseif (slvl >= 10) then
      sacc = accbonus1;
    end
  elseif (sjob == 14) then -- Dragoon
    if (slvl >= 30) then
      sacc = accbonus1;
    end
  elseif (sjob == 19) then -- Dancer
    if (slvl >= 30) then
      sacc = accbonus1;
    end
  end

  -- Add only the highest
  if (sacc > acc) then
    acc = sacc;
  end

	effect:subtractMod(MOD_ACC,acc);
end;]]--