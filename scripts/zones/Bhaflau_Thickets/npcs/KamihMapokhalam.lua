-----------------------------------
--	Author: ReaperX
-- 	KamihMapokhalam (BLU NPC @ F-6 guarding entrance to the undersea ruins)
-- 	Lets you enter the undersea ruins if you trade her a silverpiece, or if you have captain rank or a remnants permit.
--  Lets you buy a map to the ruins for 3 mythril pieces.
-- 
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

--------- some debug code ------------------------

player:setVar("MERCENARY_RANK",10); -- set your mercenary rank

--------------------------------------------

--------- events -----------
-- 0x0078 : ruins are now open to the public, you can gain admittance for 1 silver piece or buy a map for 3 mythril.
-- 0x0079 : very well, you may proceed (entry animation)
-- 0x007A : Heading outside? Be aware that you will be required to pay a fee 	if you wish to reenter the ruins.
-- 0x0080 : she steps to the side
-- 0x0081 : she looks west
-- 0x0082 : she looks east
-- 0x0083 : ???
-- 0x0092 : Here is your map of the undersea ruins, keep it safe.
-- 0x0093 : You already have a map of the ruins.

rank = player:getVar("MERCENARY_RANK"); 

z_position = player:getZPos();

if (z_position < 597 ) then  -- standing south of her (heading in)

  if ((player:hasKeyItem(0x356) == 1) or (rank == 11)) then  -- you can get in for free if you have a remnants permit or captain rank 
    if (rank == 11) then
      player:specialMessage(1080,0x38D); -- show Captain Wildcat Badge first if both
    else
      player:specialMessage(1080,0x356); -- show Remnants Permit
    end
    event = Event(0x0079);
  else
    event = Event(0x0078);
  end;
else  -- standing north of her (exiting)
  event = Event(0x007A);
end

player:startEvent(event); 
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
  
  if (trade:hasItemQty(2185,1)) then    -- 1 silver coin
		player:startEvent(Event(0x0079)); 
		trade:isComplete();
	elseif (trade:hasItemQty(2186,3)) then     -- 3 mythril coins
	  hasmap = player:hasKeyItem(0x749);
	  --print(hasmap);
	  if (hasmap == 1) then  -- player already has map
	    player:startEvent(Event(0x0093)); 
	  else
	    player:startEvent(Event(0x0092));  
	    trade:isComplete();
	  end;
	end;
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (option == 1) and (csid == 0x79) then -- going in 
  player:setPos(325, -4 ,-620, 0,0x48);  -- zone player into undersea ruins.
end
if (csid == 146) then -- player obtained map
  player:addKeyItem(0x749); -- give player map key item
  player:specialMessage(23,0x749); -- obtained key item message
end;
end;
