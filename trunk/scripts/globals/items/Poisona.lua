-----------------------------------
--	Author: Tenjou
-- 	Scroll of Poisona
--  Teaches the specified spell.
--
--	See below for jobs and levels.
-----------------------------------
 
require("scripts/globals/settings");
function OnUseItem(user,target,item)
--EASY MODE: Just edit the spell ID and the job and level arrays and the script is ready to go!
spellid = 14;
job = {3,20};
lvl = {6,10};

check = 0;
remcheck = 0;
for i = 0,table.getn(job) do
	if (check == 0) then
		main = (target:getMainJob() == job[i] and target:getMainLvl() >= lvl[i]);
		sub = (target:getSubJob() == job[i] and target:getSubLvl() >= lvl[i]);
		--print("MAIN:",main);
		--print("SUB:",sub);
		if (main or sub) then --Right job and above minimum level
			spell = target:hasSpell(spellid);
			if (spell == 0) then --Doesn't know spell
				target:addSpell(spellid)
				item:setMsg(23,spellid);
				item:setAnimation(11); --White magic
				remcheck = 0;
			else
				item:setMsg(96,spellid);
				--print("Knows spell already");
				item:setAnimation(55);
				remcheck = 1;
			end
			check = 1;
		else
			item:setMsg(95,spellid);
			--print("Too low level or not the right job");
			item:setAnimation(55);
			remcheck = 1;
		end
	end
end

--print("REMCHECK:",remcheck);
if (remcheck == 1) then item:dontRemove(); end

end;