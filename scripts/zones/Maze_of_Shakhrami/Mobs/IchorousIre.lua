require("/scripts/globals/settings");

function OnMobSpawn(mob)
end;

function OnMobDeath(mob,player)
	setGlobalVar("IchorousIreTOD",os.time());
end;