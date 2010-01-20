------------------------------------------
-- ??? to pop NM Altedour I Tavnazia. 
-- WHM AF3
-- By ReaperX
-- missing: the ??? should depop while the NM is up.
-- NM does not currently spawn.
-- pop message and position verified from 
-- http://video.google.com/videoplay?docid=9046929045228261097#
------------------------------------------

require("scripts/globals/settings");

TavnaziaBell = 0x44A;

function onTrigger(player,npc) 
if player:getVar("WHM_AF3_STATUS") == 2 then
	player:specialMessage(1145) --  You are able to make out the blurred letters. "The soul of Tavnazia will never perish."
else 
	player:specialMessage(1143)  -- You find nothing.
end;
end;  

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
if player:getVar("WHM_AF3_STATUS") == 2 and trade:getItemCount() == 1 and trade:getItemQty(TavnaziaBell) == 1 then
	trade:isComplete();
	player:specialMessage(1144);  -- You feel a conspicuously evil presence.
	loc = Zone(0xCC);
	loc:spawnMob("AltedourITavna",166, -24, -89,177,player:getId());
end;
end; 

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;
