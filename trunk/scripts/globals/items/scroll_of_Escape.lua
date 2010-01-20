-----------------------------------
---
--	Author: Xellos
-- 	Escape
--	Teaches the black magic Escape.
--
-- 	Transports party members within area of effect out of a dungeon.
--
--	Note: Spells requiring 37+ level on all usable jobs will still 
--	have sjob entry below.
---
--------------------------------

require("scripts/globals/settings");
function OnUseItem(user,target,item)

-- Define Variables
job = user:getMainJob();
sjob = user:getSubJob();
lvl = user:getMainLvl();
slvl = user:getSubLvl();
learned = user:hasSpell(263);

if(learned == 1) then
item:dontRemove();

end

--if(learned == 1) then
--item:setMsg(95,7);

--end


if(learned == 0) then
	if((job == 4 and lvl>=29) or (sjob == 4 and slvl>=29)) then
		user:addSpell(263);	
	
   item:setMsg(23,1);

else

--item:setMsg(96,7);
item:dontRemove();

end
end


item:setAnimation(12);
end;