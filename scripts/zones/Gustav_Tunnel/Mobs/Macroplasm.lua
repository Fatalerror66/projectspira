-----------------------------------
--	Author: ReaperX
-- 	Macroplasm NM for Bastok Mission 9.1 "The Salt of the Earth"
--  spawns two Microplasms when it dies
-----------------------------------

--------------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)
	loc = Zone(0xd4);
	loc:spawnMob("Microplasm",mob:getXPos()+math.random(), mob:getYPos(), mob:getZPos()+math.random(),0,nil);
	loc:spawnMob("Microplasm",mob:getXPos()+math.random(), mob:getYPos(), mob:getZPos()+math.random(),0,nil);
	mobsup = getGlobalVar("Bastok_9_1_Fight");
  setGlobalVar("Bastok_9_1_Fight",mobsup + 1);
end;

