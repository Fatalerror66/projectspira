require("scripts/globals/settings");
require("scripts/globals/rankpoints");

function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
if player:hasKeyItem(CreatureCounter) == 1 and player:getVar("TestingTime") == 2 then -- 2nd variable indicates Tahrongi or Buburimu.
	n =  player:getVar("creature_count");
	n = n + 1;
	player:setVar("creature_count",n);
	--print("Creature Count is now",n);
end;
end;