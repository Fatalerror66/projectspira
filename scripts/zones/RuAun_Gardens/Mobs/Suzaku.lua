require("scripts/globals/settings");

function OnMobSpawn(mob)
end;

function OnMobDeath(mob, killer)
	killer:showText(mob,SKY_SPEECH_OFFSET+8);
end;