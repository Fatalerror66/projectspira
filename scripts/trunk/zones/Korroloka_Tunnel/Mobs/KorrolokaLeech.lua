require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
	setGlobalVar("korrolokaLeechesSP",1);	
end;

function OnMobDeath(mob, killer)
	
	leeches=killer:getVar("korrolokaLeeches");
	leeches = leeches + 1;

	killer:setVar("korrolokaLeeches",leeches);
	
	if(leeches==3) then
		setGlobalVar("korrolokaLeechesSP",0);
	end
	-- calls the parent mobkill function to inherit whatever that does.
	mob:OnMobDeath(mob, killer, 1);

end;