-----------------------------------
--	Author: ReaperX
-- 	Nanoplasm NM for Bastok Mission 9.1 "The Salt of the Earth"
-----------------------------------

--------------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	--print(mob:getName());
end;

function OnMobDeath(mob, killer)
	mobsup = getGlobalVar("Bastok_9_1_Fight");
  setGlobalVar("Bastok_9_1_Fight",mobsup - 1);
  if (mobsup == 1) then
    setGlobalVar("Bastok_9_1_LastClear",os.time())
  end;
end;

