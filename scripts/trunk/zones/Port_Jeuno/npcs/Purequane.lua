-----------------------------------
--	Author: Snotz
-- 	Purequane
-- 	Working 100%.  Lets qualified players board the airship to San d'Oria.
-----------------------------------

--------------------------------------
-- on Trigger action.
--------------------------------------
function onTrigger(player,npc)
	csid = 0x2e;
	if player:hasKeyItem(0x08) == 1 then
	   currGil = player:getCurrGil()
	   if currGil >= 200 then
	      csid = 0x26;
	   end;
	end;
	player:startEvent( Event(csid));
end;

--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventFinish(player,csid,menuchoice)
--print("OPTION:",menuchoice);
if (csid == 0x26 and option ~= nil) then
	player:removeGil(200);
end
 end 