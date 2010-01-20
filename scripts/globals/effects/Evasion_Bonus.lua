-----------------------------------
--	Author: atkb
--  Evasion Bonus
--	Improves chance of evading physical attacks.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
  mjob = target:getMainJob();
  mlvl = target:getMainLvl();
  sjob = target:getSubJob();
  slvl = target:getSubLvl();
  eva = 10;
  seva = 10;
  evabonus1 = 10; -- THF10 / DNC15 / PUP20 (BLU69)(PUP Automaton)
  evabonus2 = 22; -- THF30 / PUP40 / DNC45
  evabonus3 = 34; -- THF50 / PUP60 / DNC75
  evabonus4 = 48; -- THF70

  -- Check MainJob
  if (mjob == 6) then -- Thief
    if (mlvl >= 70) then
      eva = evabonus4;
    elseif (mlvl >= 50) then
      eva = evabonus3;
    elseif (mlvl >= 30) then
      eva = evabonus2;
    elseif (mlvl >= 10) then
      eva = evabonus1;
    end
  elseif (mjob == 18) then -- Puppetmaster
    if (mlvl >= 60) then
      eva = evabonus3;
    elseif (mlvl >= 40) then
      eva = evabonus2;
    elseif (mlvl >= 20) then
      eva = evabonus1;
    end
  elseif (mjob == 19) then -- Dancer
    if (mlvl >= 75) then
      eva = evabonus3;
    elseif (mlvl >= 45) then
      eva = evabonus2;
    elseif (mlvl >= 15) then
      eva = evabonus1;
    end
  end

  -- Check SubJob
  if (sjob == 6) then -- Thief
    if (slvl >= 30) then
      seva = evabonus2;
    elseif (slvl >= 10) then
      seva = evabonus1;
    end
  elseif (sjob == 18) then -- Puppetmaster
    if (slvl >= 20) then
      seva = evabonus1;
    end
  elseif (sjob == 19) then -- Dancer
    if (slvl >= 15) then
      seva = evabonus1;
    end
  end

  -- Add only the highest
  if (seva > eva) then
    eva = seva;
  end

	effect:addMod(MOD_EVA,eva);
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;