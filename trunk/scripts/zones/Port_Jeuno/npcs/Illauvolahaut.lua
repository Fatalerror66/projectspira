-----------------------------------
--	Author: Snotz
-- 	Illauvolahaut
-- 	Working 100%.  Lets qualified players board the airship to Kazham.
-----------------------------------

--------------------------------------
-- on Trigger action.
--------------------------------------
function onTrigger(player,npc)
	csid = 0x2d;
	if player:hasKeyItem(0x09) == 1 then
	   currGil = player:getCurrGil()
	   if currGil >= 200 then
	      csid = 0x25;
	   end;
	end;
	player:startEvent( Event(csid));
end;

--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventFinish(player,csid,menuchoice)
--print("OPTION:",menuchoice);
if (csid == 0x25 and option ~= nil) then
	player:removeGil(200);
end
 end 