-----------------------------------
--	Author: ReaperX
-- 	Crystalline Field
-- 	CoP chapter 8 cutscenes, permits entry into Palace.
--  CoP cutscenes are not currently supported.
--  By default, PXI would not execute a script when clicking on this
--  npc (ID 16912891). I changed its type to "15" in the db to fix that.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:startEvent(Event(0x64));
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x64) and (option == 1) then
	player:setPos(-20, 0, -355.5, 192, 0x22);
end;
end;

