require("scripts/globals/settings");

function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
  mob:OnMobDeath(mob,killer,1);

  setGlobalVar("ToD-Despot",os.time()+3600);
end;