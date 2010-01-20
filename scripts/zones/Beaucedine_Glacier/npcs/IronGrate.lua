-----------------------------------
--	Author: Aurelias
-- 	Iron Grate
-- 	Moves Player to Pso'Xja
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if( npcid == 17232234 )then --1
		player:startEvent(Event(0xCD));
	elseif( npcid == 17232232 )then --2
		player:startEvent(Event(0xCB));
	elseif( npcid == 17232231 )then --3
		player:startEvent(Event(0xCA));
	elseif( npcid == 17232233 )then --4
		player:startEvent(Event(0xCC));
	elseif( npcid == 17232229 )then --5
		player:startEvent(Event(0xC8));
	elseif( npcid == 17232230 )then --6
		player:startEvent(Event(0xC9));
else
end	
end; 
 

 
-----------------------------------
--onEventFinish Action--
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
	if(csid == 0xCD and option == 1) then
		player:setPos(-299,-8,200,187, 0x09)
	elseif(csid == 0xCB and option == 1) then
		player:setPos(-240,8,-259,127, 0x09)
	elseif(csid == 0xCA and option == 1) then
		player:setPos(179,-8,240,193, 0x09)
	elseif(csid == 0xCC and option == 1) then
		player:setPos(-179,-8,-79,191, 0x09)
	elseif(csid == 0xC8 and option == 1) then
		player:setPos(398,-8,-20,126, 0x09)
	elseif(csid == 0xC9 and option == 1) then
		player:setPos(219,-8,-280,57, 0x09)
		else
		end
end;