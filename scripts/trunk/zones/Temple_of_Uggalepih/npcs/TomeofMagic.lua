--------------------------------------------
--	Author: ReaperX
--  Three books in the room on map 3, J-6 (opens with Cursed Key)
--  I assigned the dialogs to the books randomly, needs to be checked against retail.
--------------------------------------------

function onTrigger(player,npc)

if (npcid == 17428849) then
	player:startEvent(Event(0x14));
elseif (npcid == 17428850) then
	player:startEvent(Event(0x15));
elseif (npcid == 17428851) then
	player:startEvent(Event(0x16));
end;
end;