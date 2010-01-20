-- Hinge Oils
-- by ReaperX
-- mobs involved in Windurst Mission 7-1

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
mobsup = getGlobalVar("HingeOilsUp");
mobsup = mobsup + 1;
setGlobalVar("HingeOilsUp",mobsup);
end;

function OnMobDeath(mob, player)
mobsup = getGlobalVar("HingeOilsUp");
mobsup = mobsup - 1;
setGlobalVar("HingeOilsUp",mobsup);
end;