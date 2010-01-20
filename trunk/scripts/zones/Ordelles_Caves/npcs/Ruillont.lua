-----------------------------------
-- Ruillont
-- lost knight in Sandy mission 2-1 "The Rescue Drill"
-- by ReaperX

-- Wiki says that any of the other 8 NPCs may have the sword:
-- http://wiki.ffxiclopedia.org/wiki/The_Rescue_Drill
-- but I could only find the sword event for 3 of them.

-- not implemented: check that the item traded to him is the specific bronze sword
-- that was obtained from another NPC. For now we just check that the item was
-- obtained.

require("scripts/globals/rankpoints");

RUILLONT_OFFSET = 1086;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


if (player:getMissionStatus(0,3) == 1) and (player:getVar("mission_status") == 7) then
  player:startEvent(Event(0x1));
elseif ((player:getMissionStatus(0,3) == 1) and (player:getVar("mission_status") >= 10)) or (player:getMissionStatus(0,3) == 2) then
  player:showText(npc, RUILLONT_OFFSET + 9);
elseif (player:getMissionStatus(0,3) == 1) and (player:getVar("mission_status") >= 8) then
  player:showText(npc, RUILLONT_OFFSET); -- "Confound it! If I only had my sword, I'd cut through these fiends single-handedly..."
elseif (player:getNation() == 0) then
	player:showText(npc, RUILLONT_OFFSET + 2);
else
	player:showText(npc, RUILLONT_OFFSET + 1);
end;
if (player:getVar("mission_status") == 10) and (DEBUG_MODE) then
  player:setPos(-350, 38, 264, 253, 0x66); -- to Vicorpasse
end;
end

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (player:getMissionStatus(0,3) == 1) and (player:getVar("mission_status") == 9) and (trade:getItemCount() == 1) and (trade:hasItemQty(BronzeSword,1)) then
  trade:isComplete();
  player:startEvent(Event(0x2));
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x1) then
  player:setVar("mission_status",8);
  player:setVar("npc_has_sword",math.random(3)) -- select one of the 3 NPCs that may have the sword: Galaihaurat (1), Equesobillot (2), Deaufrain (3)
elseif (csid == 0x2) then
	player:setVar("mission_status",10);
end
end;