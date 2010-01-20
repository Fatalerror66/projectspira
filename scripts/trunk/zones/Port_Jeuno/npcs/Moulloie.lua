-----------------------------------
--	Author: Tenjou
-- 	Moulloie
-- 	Working 100%.  Informs players that they ought to use the other door.
-----------------------------------

--------------------------------------
-- on Trigger action.
--------------------------------------
function onTrigger(player,npc)
csid = 0x2e;
pass = player:hasKeyItem(0x08);
currGil = player:getCurrGil();
if (pass == 1 and currGil >= 200)then
	csid = 0x26;
end
player:startEvent(Event(csid));
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,menuchoice)
--print("OPTION:",menuchoice);
if (csid == 0x26 and option ~= nil) then
	player:removeGil(200);
end
 end 