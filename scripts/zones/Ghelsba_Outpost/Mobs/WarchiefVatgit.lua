-- Warchief Vatgit 
-- by ReaperX
-- needed for Windurst and Bastok missions 2-3 (San d'Oria first path)
-- limitation: you will only get title and credit if you killed it. Party/alliance kill not supported.

require("scripts/globals/settings");

WarchiefWrecker = 2;

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)

	--print(mob:getName());

end;

function OnMobDeath(mob, killer)

  --print("Killed Warchief");
  if (killer:getMissionStatus(killer:getNation(),6) == 1) and (killer:getVar("mission_status") == 4) then -- same for Windurst and Bastok
  	killer:setVar("mission_status",5);
  end;
  killer:setTitle(WarchiefWrecker);
	-- calls the parent mobkill function to inherit whatever that does.
	mob:OnMobDeath(mob, killer, 1);

end;