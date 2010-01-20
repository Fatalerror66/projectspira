-- Auto-Generated Script from FFXImonV3 
-- By: Mana
-- RDM AF2 quest by ReaperX

package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

OldPocketWatch = 0xC5;
      OldBoots = 0xC6;
   VelvetCloth = 828;
----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	elseif (player:hasKeyItem(OldPocketWatch) == 1) and (player:hasKeyItem(OldBoots) == 0) and (trade:hasItemQty(VelvetCloth,1)) and (trade:getItemCount() == 1) then
		trade:isComplete();
		player:startEvent(Event(0x25));
	end 
end; 

--[[ Events
 0026 (CoP CS with Ulmia)
 0001 
 0232 
 0235 default
 0233 
 0234 
 0236 
 0025 RDM AF2 (after trading velvet cloth)
 0030 RDM AF2 (wants velvet cloth)
 003A RDM AF2 (tells you to leave)
 0010 
--]]


----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
if (player:hasKeyItem(OldBoots) == 1) then
  player:startEvent(Event(0x3A));
elseif (player:hasKeyItem(OldPocketWatch) == 1) then
  player:startEvent(Event(0x30));
else
  player:startEvent(Event(0x235)) 
end;
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x25) then
	player:addKeyItem(OldBoots);
	player:specialMessage(KEYITEM_OBTAINED,OldBoots);
	player:removeKeyItem(OldPocketWatch);
end;
end;